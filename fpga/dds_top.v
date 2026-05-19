// dds_top.v
`default_nettype none

module dds_top (
    input  wire clk,       // 16.384 MHz (Si5351 CLK0)
    input  wire rst_n,

    // SPI Slave (ESP32 → FPGA)
    input  wire spi_clock,
    input  wire spi_cs_n,
    input  wire spi_mosi,

    // MCP4922 SPI Master (FPGA → DAC)
    output wire dac_sck,
    output wire dac_cs_n,
    output wire dac_mosi,
    output wire dac_ldac_n,

    // Debug pins (dds_outA[7:0])
    output wire [7:0]  dds_outA,
    output wire [7:0]  dds_outB
);

    // -------------------------------------------------------------------------
    // DDS 클럭 인에이블: 16.384 MHz ÷ 16 = 1.024 MHz 유효 샘플레이트
    // -------------------------------------------------------------------------
    reg [3:0] dds_ce_cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            dds_ce_cnt <= 4'd0;
        else
            dds_ce_cnt <= dds_ce_cnt + 4'd1;
    end

    wire dds_ce = (dds_ce_cnt == 4'd15);

    // -------------------------------------------------------------------------
    // Wires from SPI slave
    // -------------------------------------------------------------------------
    wire [3:0]  register_main_mode;
    wire [3:0]  register_sub_mode;
    wire        register_output_en;
    wire [27:0] register_freq0;
    wire [27:0] register_freq1;
    wire [11:0] register_phase0;
    wire [11:0] register_phase1;
    wire [7:0]  register_gain;
    wire [7:0]  register_offset;

    // -------------------------------------------------------------------------
    // SPI Slave
    // -------------------------------------------------------------------------
    spi_slave_interface inst_spi_slave (
        .clk                     (clk),
        .rst_n                   (rst_n),
        .spi_clock               (spi_clock),
        .spi_cs_n                (spi_cs_n),
        .spi_mosi                (spi_mosi),
        .register_main_mode      (register_main_mode),
        .register_sub_mode       (register_sub_mode),
        .register_output_en      (register_output_en),
        .register_freq0          (register_freq0),
        .register_freq1          (register_freq1),
        .register_phase0         (register_phase0),
        .register_phase1         (register_phase1),
        .register_gain           (register_gain),
        .register_offset         (register_offset)
    );

    // -------------------------------------------------------------------------
    // DDS (유효 클럭 1.024 MHz, clk_en으로 게이팅)
    // -------------------------------------------------------------------------
    dds inst_dds (
        .clk                (clk),
        .rst_n              (rst_n),
        .clk_en             (dds_ce),
        .register_freq0     (register_freq0),
        .register_freq1     (register_freq1),
        .register_phase0    (register_phase0),
        .register_phase1    (register_phase1),
        .register_main_mode (register_main_mode),
        .register_sub_mode  (register_sub_mode),
        .register_output_en (register_output_en),
        .register_gain      (register_gain),
        .register_offset    (register_offset),
        .dds_outA           (dds_outA),
        .dds_outB           (dds_outB)
    );

    // -------------------------------------------------------------------------
    // MCP4922 DAC SPI Master (16.384 MHz → SPI 8.192 MHz, DAC 업데이트 ~234 kHz)
    // -------------------------------------------------------------------------
    mcp4922_spi_master inst_mcp4922 (
        .clk        (clk),
        .rst_n      (rst_n),
        .dac_a      ({dds_outA, 4'b0000}),
        .dac_b      ({dds_outB, 4'b0000}),
        .spi_clk    (dac_sck),
        .spi_cs_n   (dac_cs_n),
        .spi_mosi   (dac_mosi),
        .spi_ldac_n (dac_ldac_n)
    );

endmodule
