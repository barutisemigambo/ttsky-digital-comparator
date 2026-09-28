/*
 * Copyright (c) 2024 Baruti Semigambo
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered or selected
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // Digital Comparator:
  // ui_in[0] ni V+
  // ui_in[1] ni V-
  // uo_out[0] ni Vout (Inakuwa 1 kama V+ ni kubwa kuliko V-)

  assign uo_out[0] = (ui_in[0] > ui_in[1]) ? 1'b1 : 1'b0;

  // Weka pini zote zilizobaki zitoe 0 ili kuzuia makosa ya OpenLane
  assign uo_out[7:1] = 7'b0;
  assign uio_out     = 8'b0;
  assign uio_oe      = 8'b0;

  // Zima maonyo ya unused inputs
  wire _unused = &{ena, clk, rst_n, ui_in[7:2], uio_in, 1'b0};

endmodule
