// dds.v
`default_nettype none

module dds (
    input  wire        clk,
    input  wire        rst_n,

    input  wire [27:0] register_freq0,
    input  wire [27:0] register_freq1,
    input  wire [11:0] register_phase0,
    input  wire [11:0] register_phase1,
    input  wire [3:0]  register_main_mode,
    input  wire [3:0]  register_sub_mode,
    input  wire        register_output_en,
    input  wire [7:0]  register_gain,
    input  wire signed [7:0] register_offset,

    output reg  [7:0]  dds_outA,
    output reg  [7:0]  dds_outB
);

    // -------------------------------------------------------------------------
    // Phase accumulators
    // -------------------------------------------------------------------------
    reg [27:0] phase_acc0;
    reg [27:0] phase_acc1;

    always @(posedge clk) begin
        if (!rst_n) begin
            phase_acc0 <= 0;
            phase_acc1 <= 0;
        end else begin
            phase_acc0 <= phase_acc0 + register_freq0;
            phase_acc1 <= phase_acc1 + register_freq1;
        end
    end

    wire [11:0] phase_out0 = phase_acc0[27:16] + register_phase0;
    wire [11:0] phase_out1 = phase_acc1[27:16] + register_phase1;

    wire [7:0] lut_addr0 = phase_out0[11:4];
    wire [7:0] lut_addr1 = phase_out1[11:4];

    // -------------------------------------------------------------------------
    // Sine ROM (ICT)
    // -------------------------------------------------------------------------
    reg [7:0] sine_memory [0:255];
    initial $readmemh("mems/sine.mem", sine_memory);

    reg [7:0] sine_data0;
    reg [7:0] sine_data1;

    always @(posedge clk) begin
        sine_data0 <= sine_memory[lut_addr0];
        sine_data1 <= sine_memory[lut_addr1];
    end

    wire [8:0] sine_sum   = {1'b0, sine_data0} + {1'b0, sine_data1};
    wire [7:0] sine_mixed = sine_sum[8:1];

    // -------------------------------------------------------------------------
    // EST ROM (est00~est02) - 개별 1D 배열
    // -------------------------------------------------------------------------
    reg [7:0] est_mem0 [0:255];
    reg [7:0] est_mem1 [0:255];
    reg [7:0] est_mem2 [0:255];

    initial begin
        $readmemh("mems/est00.mem", est_mem0);
        $readmemh("mems/est01.mem", est_mem1);
        $readmemh("mems/est02.mem", est_mem2);
    end

    reg [7:0] est_data;

    always @(posedge clk) begin
        case (register_sub_mode[1:0])
            2'd0: est_data <= est_mem0[lut_addr0];
            2'd1: est_data <= est_mem1[lut_addr0];
            2'd2: est_data <= est_mem2[lut_addr0];
            default: est_data <= 8'h80;
        endcase
    end

    // -------------------------------------------------------------------------
    // PAIN ROM (p00~p15) - 개별 1D 배열
    // -------------------------------------------------------------------------
    reg [7:0] pain_mem0  [0:255];
    reg [7:0] pain_mem1  [0:255];
    reg [7:0] pain_mem2  [0:255];
    reg [7:0] pain_mem3  [0:255];
    reg [7:0] pain_mem4  [0:255];
    reg [7:0] pain_mem5  [0:255];
    reg [7:0] pain_mem6  [0:255];
    reg [7:0] pain_mem7  [0:255];
    reg [7:0] pain_mem8  [0:255];
    reg [7:0] pain_mem9  [0:255];
    reg [7:0] pain_mem10 [0:255];
    reg [7:0] pain_mem11 [0:255];
    reg [7:0] pain_mem12 [0:255];
    reg [7:0] pain_mem13 [0:255];
    reg [7:0] pain_mem14 [0:255];
    reg [7:0] pain_mem15 [0:255];

    initial begin
        $readmemh("mems/p00.mem", pain_mem0);
        $readmemh("mems/p01.mem", pain_mem1);
        $readmemh("mems/p02.mem", pain_mem2);
        $readmemh("mems/p03.mem", pain_mem3);
        $readmemh("mems/p04.mem", pain_mem4);
        $readmemh("mems/p05.mem", pain_mem5);
        $readmemh("mems/p06.mem", pain_mem6);
        $readmemh("mems/p07.mem", pain_mem7);
        $readmemh("mems/p08.mem", pain_mem8);
        $readmemh("mems/p09.mem", pain_mem9);
        $readmemh("mems/p10.mem", pain_mem10);
        $readmemh("mems/p11.mem", pain_mem11);
        $readmemh("mems/p12.mem", pain_mem12);
        $readmemh("mems/p13.mem", pain_mem13);
        $readmemh("mems/p14.mem", pain_mem14);
        $readmemh("mems/p15.mem", pain_mem15);
    end

    reg [7:0] pain_data;

    always @(posedge clk) begin
        case (register_sub_mode)
            4'd0:  pain_data <= pain_mem0[lut_addr0];
            4'd1:  pain_data <= pain_mem1[lut_addr0];
            4'd2:  pain_data <= pain_mem2[lut_addr0];
            4'd3:  pain_data <= pain_mem3[lut_addr0];
            4'd4:  pain_data <= pain_mem4[lut_addr0];
            4'd5:  pain_data <= pain_mem5[lut_addr0];
            4'd6:  pain_data <= pain_mem6[lut_addr0];
            4'd7:  pain_data <= pain_mem7[lut_addr0];
            4'd8:  pain_data <= pain_mem8[lut_addr0];
            4'd9:  pain_data <= pain_mem9[lut_addr0];
            4'd10: pain_data <= pain_mem10[lut_addr0];
            4'd11: pain_data <= pain_mem11[lut_addr0];
            4'd12: pain_data <= pain_mem12[lut_addr0];
            4'd13: pain_data <= pain_mem13[lut_addr0];
            4'd14: pain_data <= pain_mem14[lut_addr0];
            4'd15: pain_data <= pain_mem15[lut_addr0];
        endcase
    end

    // -------------------------------------------------------------------------
    // Gain & Offset
    // -------------------------------------------------------------------------
    function automatic [7:0] process_sample;
        input [7:0] din;
        input [7:0] gain;
        input [7:0] offset;

        reg signed  [8:0]  s_in;
        reg signed  [17:0] post_gain;
        reg signed  [7:0]  result;
        begin
            s_in           = $signed(din);
            post_gain      = s_in * $signed({1'b0, gain});
            result         = post_gain[15:8];
            process_sample = 8'hFF - ($unsigned(result) + 8'h80);
        end
    endfunction

    // -------------------------------------------------------------------------
    // 출력 선택
    // -------------------------------------------------------------------------
    localparam MAIN_ICT       = 4'd0;
    localparam MAIN_EST       = 4'd1;
    localparam MAIN_SCRAMBLER = 4'd2;

    localparam ICT_IF         = 4'd0;
    localparam ICT_LF         = 4'd1;

    always @(posedge clk) begin
        if (!rst_n || !register_output_en) begin
            dds_outA <= 8'h80;
            dds_outB <= 8'h80;
        end
        else begin
            case (register_main_mode)

                MAIN_ICT: begin
                    case (register_sub_mode)
                        ICT_IF: begin
                            dds_outA <= process_sample(sine_data0, register_gain, register_offset);
                            dds_outB <= process_sample(sine_data1, register_gain, register_offset);
                        end
                        ICT_LF: begin
                            dds_outA <= process_sample(sine_mixed, register_gain, register_offset);
                            dds_outB <= process_sample(sine_mixed, register_gain, register_offset);
                        end
                        default: begin
                            dds_outA <= 8'h80;
                            dds_outB <= 8'h80;
                        end
                    endcase
                end

                MAIN_EST: begin
                    dds_outA <= process_sample(est_data, register_gain, register_offset);
                    dds_outB <= process_sample(est_data, register_gain, register_offset);
                end

                MAIN_SCRAMBLER: begin
                    dds_outA <= process_sample(pain_data, register_gain, register_offset);
                    dds_outB <= process_sample(pain_data, register_gain, register_offset);
                end

                default: begin
                    dds_outA <= 8'h80;
                    dds_outB <= 8'h80;
                end

            endcase
        end
    end

endmodule
