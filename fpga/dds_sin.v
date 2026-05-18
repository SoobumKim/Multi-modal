// dds.v
// case1 (register_mode=0): dds_outA=freq0, dds_outB=freq1 각각
// case2 (register_mode=1): dds_outA=dds_outB=합성파

`default_nettype none

module dds_sin (
    // Clock and reset
    input  wire        clk,
    input  wire        rst_n,
    
    // Registers
    input  wire [27:0] register_freq0,
    input  wire [27:0] register_freq1,
    input  wire [11:0] register_phase0,
    input  wire [11:0] register_phase1,
    input  wire [1:0]  register_mode,
    input  wire [7:0]  register_gain,
    input  wire signed [7:0] register_offset,

    // DDS Output (두 채널)
    output reg [7:0]   dds_outA,
    output reg [7:0]   dds_outB
);

    /////////////////////////////////////////////////////////////////////////////
    // Phase accumulator 2개 ////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////

    reg [27:0] phase_accumulator0;
    reg [27:0] phase_accumulator1;

    always @(posedge clk) begin
        if (!rst_n) begin
            phase_accumulator0 <= 0;
            phase_accumulator1 <= 0;
        end
        else begin
            phase_accumulator0 <= phase_accumulator0 + register_freq0;
            phase_accumulator1 <= phase_accumulator1 + register_freq1;
        end
    end

    /////////////////////////////////////////////////////////////////////////////
    // Sin ROM //////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////

    reg signed [7:0] sine_memory [0:255];
    initial begin
        $display("Loading rom.");
        $readmemh("sine.mem", sine_memory);
    end

    reg signed [7:0] sine_data0;
    reg signed [7:0] sine_data1;

    always @(posedge clk) begin
        sine_data0 = sine_memory[phase_post_offset0[11:4]];
        sine_data1 = sine_memory[phase_post_offset1[11:4]];
    end

    /////////////////////////////////////////////////////////////////////////////
    // 합성파 ///////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////

    wire signed [8:0] sine_sum   = {sine_data0[7], sine_data0}
                                 + {sine_data1[7], sine_data1};
    wire signed [7:0] sine_mixed = sine_sum[8:1];  // /2

    /////////////////////////////////////////////////////////////////////////////
    // Gain & Offset 공용 함수 //////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////

    function [7:0] process_sample;
        input signed [7:0] din;
        input        [7:0] gain;
        input signed [7:0] offset;
        reg signed  [15:0] post_gain;
        reg signed   [8:0] post_offset;
        reg signed   [7:0] saturated;
        begin
            post_gain   = gain * din;
            post_offset = post_gain[15:8] + offset;
            if      (post_offset > 127)  saturated = 127;
            else if (post_offset < -128) saturated = -128;
            else                         saturated = post_offset[7:0];
            // signed → unsigned (XOR 0x80)
            process_sample = saturated ^ 8'h80;
        end
    endfunction

    /////////////////////////////////////////////////////////////////////////////
    // PRNG /////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////

    wire [7:0] prng_data;

    prng inst_prng (
        .clk(clk),
        .rst_n(rst_n),
        .prng_data(prng_data)
    );

    /////////////////////////////////////////////////////////////////////////////
    // 출력 선택 ////////////////////////////////////////////////////////////////
    //
    // register_mode[0] = 0 → case1: A=freq0, B=freq1
    // register_mode[0] = 1 → case2: A=B=합성파
    /////////////////////////////////////////////////////////////////////////////

    always @(posedge clk) begin
        if (register_mode[0] == 0) begin
            // case1: 각각 독립 출력
            dds_outA <= process_sample(sine_data0, register_gain, register_offset);
            dds_outB <= process_sample(sine_data1, register_gain, register_offset);
        end
        else begin
            // case2: 합성파 동일 출력
            dds_outA <= process_sample(sine_mixed, register_gain, register_offset);
            dds_outB <= process_sample(sine_mixed, register_gain, register_offset);
        end
    end

endmodule