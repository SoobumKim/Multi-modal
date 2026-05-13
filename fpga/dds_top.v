// dds_top.v
// Top module: SPI slave(ESP32) + DDS 2채널 + MCP4922 SPI master

`default_nettype none

module dds_top (

    // Clock and reset
    input  wire clk,
    input  wire rst_n,

    // SPI Slave Interface (ESP32 → FPGA)
    input  wire spi_clock,
    input  wire spi_cs_n,
    input  wire spi_mosi,

    // Inputs
    input  wire fselect,
    input  wire pselect,

    // MCP4922 SPI Master 출력 (FPGA → DAC)
    output wire dac_sck,
    output wire dac_cs_n,
    output wire dac_mosi,
    output wire dac_ldac_n
);

    /////////////////////////////////////////////////////////////////////////////
    // Wires ////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////

    wire [27:0] register_freq0;
    wire [27:0] register_freq1;
    wire [11:0] register_phase0;
    wire [11:0] register_phase1;
    wire [1:0]  register_mode;
    wire [7:0]  register_gain;
    wire [7:0]  register_offset;

    wire [7:0]  dds_outA;   // MCP4922 채널A
    wire [7:0]  dds_outB;   // MCP4922 채널B

    /////////////////////////////////////////////////////////////////////////////
    // SPI Slave Interface (기존 그대로) ////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////

    spi_slave_interface inst_spi_slave_interface (
        .clk            (clk),
        .rst_n          (rst_n),
        .spi_clock      (spi_clock),
        .spi_cs_n       (spi_cs_n),
        .spi_mosi       (spi_mosi),
        .register_freq0 (register_freq0),
        .register_freq1 (register_freq1),
        .register_phase0(register_phase0),
        .register_phase1(register_phase1),
        .register_mode  (register_mode),
        .register_gain  (register_gain),
        .register_offset(register_offset)
    );

    /////////////////////////////////////////////////////////////////////////////
    // DDS (dds_output → dds_outA, dds_outB 두 채널로 변경) ///////////////////
    /////////////////////////////////////////////////////////////////////////////

    dds inst_dds (
        .clk            (clk),
        .rst_n          (rst_n),
        .register_freq0 (register_freq0),
        .register_freq1 (register_freq1),
        .register_phase0(register_phase0),
        .register_phase1(register_phase1),
        .fselect        (fselect),
        .pselect        (pselect),
        .register_mode  (register_mode),
        .register_gain  (register_gain),
        .register_offset(register_offset),
        .dds_outA       (dds_outA),
        .dds_outB       (dds_outB)
    );

    /////////////////////////////////////////////////////////////////////////////
    // MCP4922 SPI Master ///////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////

    mcp4922_spi_master inst_mcp4922 (
        .clk        (clk),
        .rst_n      (rst_n),
        .dac_a      ({dds_outA, 4'b0000}),  // 8비트 → 12비트 (하위 4비트 0)
        .dac_b      ({dds_outB, 4'b0000}),
        .spi_clk    (dac_sck),
        .spi_cs_n   (dac_cs_n),
        .spi_mosi   (dac_mosi),
        .spi_ldac_n (dac_ldac_n)
    );

endmodule
