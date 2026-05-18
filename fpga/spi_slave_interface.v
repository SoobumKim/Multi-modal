// spi_slave_interface.v
`default_nettype none

module spi_slave_interface (
    input  wire        clk,
    input  wire        rst_n,

    input  wire        spi_clock,
    input  wire        spi_cs_n,
    input  wire        spi_mosi,

    output reg [3:0]   register_main_mode,
    output reg [3:0]   register_sub_mode,
    output reg         register_output_en,
    output reg [27:0]  register_freq0,
    output reg [27:0]  register_freq1,
    output reg [11:0]  register_phase0,
    output reg [11:0]  register_phase1,
    output reg [7:0]   register_gain,
    output reg [7:0]   register_offset
);

    reg [31:0] shift_register;
    reg spi_clock_d;
    reg spi_cs_n_d;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            spi_clock_d        <= 0;
            spi_cs_n_d         <= 1;
            shift_register     <= 32'd0;
            register_main_mode <= 0;
            register_sub_mode  <= 0;
            register_output_en <= 0;
            register_freq0     <= 0;
            register_freq1     <= 0;
            register_phase0    <= 0;
            register_phase1    <= 0;
            register_gain      <= 8'hFF;
            register_offset    <= 0;
        end
        else begin
            spi_clock_d <= spi_clock;
            spi_cs_n_d  <= spi_cs_n;

            if (spi_clock == 1 && spi_clock_d == 0) begin
                shift_register <= {shift_register[30:0], spi_mosi};
            end

            if (spi_cs_n == 1 && spi_cs_n_d == 0) begin
                case (shift_register[31:28])
                    4'h0: begin
                        register_main_mode <= shift_register[3:0];
                        register_sub_mode  <= shift_register[7:4];
                        register_output_en <= shift_register[8];
                    end
                    4'h1: register_freq0  <= shift_register[27:0];
                    4'h2: register_freq1  <= shift_register[27:0];
                    4'h3: register_phase0 <= shift_register[11:0];
                    4'h4: register_phase1 <= shift_register[11:0];
                    4'h5: register_gain   <= shift_register[7:0];
                    4'h6: register_offset <= shift_register[7:0];
                endcase
            end
        end
    end

endmodule