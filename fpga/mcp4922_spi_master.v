// mcp4922_spi_master.v
// MCP4922 Dual 12-bit DAC SPI Master
//
// 동작 순서:
//   채널A 16비트 전송 → CS HIGH → 채널B 16비트 전송 → CS HIGH → LDAC 펄스
//
// SPI 클럭 = 시스템 클럭 / 2 = 512kHz (1.024MHz 기준)
//
// MCP4922 패킷 구조 (16비트):
//   [15]   A/B  : 0=채널A, 1=채널B
//   [14]   BUF  : 0=unbuffered VREF
//   [13]   GA   : 1=1x gain
//   [12]   SHDN : 1=출력 활성화
//   [11:0] DATA : 12비트 DAC 값

`default_nettype none

module mcp4922_spi_master (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [11:0] dac_a,      // 채널A 12비트 데이터
    input  wire [11:0] dac_b,      // 채널B 12비트 데이터
    output reg         spi_clk,
    output reg         spi_cs_n,
    output reg         spi_mosi,
    output reg         spi_ldac_n  // LOW 펄스 → 두 채널 동시 업데이트
);

    // 패킷 생성: [ch][BUF=0][GA=1][SHDN=1][D11:D0]
    function [15:0] make_packet;
        input        ch;
        input [11:0] data;
        begin
            make_packet = {ch, 1'b0, 1'b1, 1'b1, data};
        end
    endfunction

    localparam IDLE     = 3'd0;
    localparam LOAD     = 3'd1;
    localparam TRANSFER = 3'd2;
    localparam CS_HIGH  = 3'd3;
    localparam LDAC     = 3'd4;

    reg [2:0]  state;
    reg [15:0] shift_reg;
    reg [3:0]  bit_cnt;     // 15 → 0
    reg        ch_sel;      // 0=채널A, 1=채널B
    reg        clk_div;     // 시스템클럭 /2 → SPI 512kHz

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state      <= IDLE;
            spi_clk    <= 0;
            spi_cs_n   <= 1;
            spi_mosi   <= 0;
            spi_ldac_n <= 1;
            shift_reg  <= 0;
            bit_cnt    <= 0;
            ch_sel     <= 0;
            clk_div    <= 0;
        end
        else begin
            clk_div <= ~clk_div;

            case (state)

                // IDLE: clk_div 타이밍에 맞춰 전송 시작
                IDLE: begin
                    spi_cs_n   <= 1;
                    spi_ldac_n <= 1;
                    spi_clk    <= 0;
                    if (clk_div == 0) begin
                        ch_sel <= 0;
                        state  <= LOAD;
                    end
                end

                // LOAD: 패킷 준비, CS LOW
                LOAD: begin
                    shift_reg <= (ch_sel == 0) ? make_packet(0, dac_a)
                                               : make_packet(1, dac_b);
                    bit_cnt   <= 15;
                    spi_cs_n  <= 0;
                    state     <= TRANSFER;
                end

                // TRANSFER: CLK 토글하며 MSB부터 전송
                TRANSFER: begin
                    if (clk_div == 0) begin
                        // 하강엣지: 다음 비트 MOSI에 출력
                        spi_clk   <= 0;
                        spi_mosi  <= shift_reg[15];
                        shift_reg <= {shift_reg[14:0], 1'b0};
                    end
                    else begin
                        // 상승엣지: MCP4922 샘플링
                        spi_clk <= 1;
                        if (bit_cnt == 0) begin
                            spi_clk <= 0;
                            state   <= CS_HIGH;
                        end
                        else begin
                            bit_cnt <= bit_cnt - 1;
                        end
                    end
                end

                // CS_HIGH: CS 올리기 → 채널A면 채널B로, 채널B면 LDAC으로
                CS_HIGH: begin
                    spi_cs_n <= 1;
                    spi_mosi <= 0;
                    if (ch_sel == 0) begin
                        ch_sel <= 1;
                        state  <= LOAD;
                    end
                    else begin
                        state  <= LDAC;
                    end
                end

                // LDAC: 1클럭 LOW 펄스 → VOUTA/VOUTB 동시 업데이트
                LDAC: begin
                    spi_ldac_n <= 0;
                    ch_sel     <= 0;
                    state      <= IDLE;
                end

            endcase
        end
    end

endmodule