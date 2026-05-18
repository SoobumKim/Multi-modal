// dds_top.v
`default_nettype none

module dds_top (
    input  wire clk,
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
    // wire [1:0]  register_pause_id;
    // wire [7:0]  register_packet_duration;

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
        .register_offset         (register_offset),
        // .register_pause_id       (register_pause_id),
        // .register_packet_duration(register_packet_duration)
    );

    // -------------------------------------------------------------------------
    // DDS
    // -------------------------------------------------------------------------
    dds inst_dds (
        .clk                (clk),
        .rst_n              (rst_n),
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
    // MCP4922 DAC SPI Master
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