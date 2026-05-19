// mcp4922_spi_master.v
// MCP4922 Dual 12-bit DAC SPI Master
//
// 동작 순서:
//   LOAD_A → 16 × (SCK_LOW → SCK_HIGH) → TRAIL → CS_HIGH
//   → LOAD_B → 16 × (SCK_LOW → SCK_HIGH) → TRAIL → CS_HIGH
//   → LDAC(2 cycle) → IDLE
//
// 시스템 클럭 16.384 MHz 기준:
//   SPI 클럭 = 8.192 MHz (SCK_LOW 1 cycle + SCK_HIGH 1 cycle)
//   DAC 업데이트 레이트 ≈ 227 kHz
//
// MCP4922 타이밍 충족 (1 cycle = 61 ns):
//   t_CSS (CS→SCK 셋업) : LOAD + SCK_LOW = 2 cycle = 122 ns  > 50 ns ✓
//   t_CSH (SCK→CS 홀드) : TRAIL          = 1 cycle =  61 ns  > 50 ns ✓
//   t_CSW (CS HIGH 폭)  : CS_HIGH         = 1 cycle =  61 ns  > 50 ns ✓
//   t_LDAC (LDAC 폭)    : LDAC + LDAC2   = 2 cycle = 122 ns  > 100 ns ✓
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
    input  wire [11:0] dac_a,
    input  wire [11:0] dac_b,
    output reg         spi_clk,
    output reg         spi_cs_n,
    output reg         spi_mosi,
    output reg         spi_ldac_n
);

    function [15:0] make_packet;
        input        ch;
        input [11:0] data;
        begin
            make_packet = {ch, 1'b0, 1'b1, 1'b1, data};
        end
    endfunction

    localparam IDLE     = 4'd0;
    localparam LOAD     = 4'd1;
    localparam SCK_LOW  = 4'd2;  // MOSI 세팅, SCK=0
    localparam SCK_HIGH = 4'd3;  // SCK=1 → MCP4922 rising edge 샘플링
    localparam TRAIL    = 4'd4;  // 마지막 비트 클럭 후 SCK=0 (t_CSH 확보)
    localparam CS_HIGH  = 4'd5;  // CS=1 → 데이터 latch
    localparam LDAC     = 4'd6;  // LDAC LOW (1번째 사이클)
    localparam LDAC2    = 4'd7;  // LDAC LOW (2번째 사이클, 122 ns 확보)

    reg [3:0]  state;
    reg [15:0] shift_reg;
    reg [3:0]  bit_cnt;   // 15 → 0
    reg        ch_sel;    // 0=채널A, 1=채널B

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
        end
        else begin
            case (state)

                IDLE: begin
                    spi_cs_n   <= 1;
                    spi_ldac_n <= 1;
                    spi_clk    <= 0;
                    ch_sel     <= 0;
                    state      <= LOAD;
                end

                // CS LOW + 패킷 준비
                LOAD: begin
                    shift_reg <= ch_sel ? make_packet(1, dac_b)
                                       : make_packet(0, dac_a);
                    bit_cnt   <= 4'd15;
                    spi_cs_n  <= 0;
                    state     <= SCK_LOW;
                end

                // MOSI에 현재 비트 출력, SCK=0
                SCK_LOW: begin
                    spi_clk   <= 0;
                    spi_mosi  <= shift_reg[15];
                    shift_reg <= {shift_reg[14:0], 1'b0};
                    state     <= SCK_HIGH;
                end

                // SCK=1 → MCP4922 샘플링
                SCK_HIGH: begin
                    spi_clk <= 1;
                    if (bit_cnt == 0) begin
                        state <= TRAIL;
                    end else begin
                        bit_cnt <= bit_cnt - 1;
                        state   <= SCK_LOW;
                    end
                end

                // 마지막 비트 전송 후 SCK=0 (t_CSH 확보)
                TRAIL: begin
                    spi_clk <= 0;
                    state   <= CS_HIGH;
                end

                // CS=1 → 데이터 latch / 다음 채널 또는 LDAC으로
                CS_HIGH: begin
                    spi_cs_n <= 1;
                    spi_mosi <= 0;
                    if (ch_sel == 0) begin
                        ch_sel <= 1;
                        state  <= LOAD;
                    end else begin
                        state <= LDAC;
                    end
                end

                // LDAC LOW 1번째 사이클
                LDAC: begin
                    spi_ldac_n <= 0;
                    state      <= LDAC2;
                end

                // LDAC LOW 2번째 사이클 (합계 122 ns > 100 ns min)
                LDAC2: begin
                    spi_ldac_n <= 0;
                    ch_sel     <= 0;
                    state      <= IDLE;
                end

            endcase
        end
    end

endmodule
