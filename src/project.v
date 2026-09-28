/*
 * Digital Comparator for Tiny Tapeout SKY130
 * ui_in[0] = V+
 * ui_in[1] = V-
 * uo_out[0] = Vout
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input wire ena,
    input wire clk,
    input wire rst_n
);

    // Digital comparator
    // V+ > V- gives HIGH
    assign uo_out[0] = ui_in[0] & ~ui_in[1];

    // Unused outputs
    assign uo_out[7:1] = 7'b0;
    assign uio_out = 8'b0;
    assign uio_oe = 8'b0;

    // Unused inputs
    wire _unused = &{ena, clk, rst_n, ui_in[7:2], uio_in, 1'b0};

endmodule
