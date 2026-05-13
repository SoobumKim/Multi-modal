module test (
    input  wire clk,
    input  wire rst_n,
    input  wire spi_clock,
    input  wire spi_cs_n,
    input  wire spi_mosi,
    output reg  debug_pin1,
    output reg  debug_pin2,
    output reg  debug_pin3,
    output reg  debug_pin
);

wire [27:0] register_freq0;
wire [27:0] register_freq1;
wire [11:0] register_phase0;
wire [11:0] register_phase1;
wire [1:0]  register_mode;
wire [7:0]  register_gain;
wire [7:0]  register_offset;

spi_slave_interface u_spi (
    .clk(clk),
    .rst_n(rst_n),
    .spi_clock(spi_clock),
    .spi_cs_n(spi_cs_n),
    .spi_mosi(spi_mosi),
    .register_freq0(register_freq0),
    .register_freq1(register_freq1),
    .register_phase0(register_phase0),
    .register_phase1(register_phase1),
    .register_mode(register_mode),
    .register_gain(register_gain),
    .register_offset(register_offset)
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        debug_pin  <= 1'b0;
        debug_pin1 <= 1'b0;
        debug_pin2 <= 1'b0;
        debug_pin3 <= 1'b0;
    end else begin
        debug_pin  <= register_gain[0];
        debug_pin1 <= register_gain[1];
        debug_pin2 <= register_gain[2];
        debug_pin3 <= register_gain[3];
    end
end

endmodule