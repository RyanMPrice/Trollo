// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 * 
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input         wb_clk_i,
    input         wb_rst_i,
    input         wbs_stb_i,
    input         wbs_cyc_i,
    input         wbs_we_i,
    input  [ 3:0] wbs_sel_i,
    input  [31:0] wbs_dat_i,
    input  [31:0] wbs_adr_i,
    output        wbs_ack_o,
    output [31:0] wbs_dat_o,
    
    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq
);
  
  wire clk;
  wire rst;

  wire [31:0] rdata; 
  wire [31:0] wdata;
  wire [BITS-1:0] count;

  wire valid;
  wire [3:0] wstrb;
  wire [31:0] la_write;

  // WB MI A
  assign valid = wbs_cyc_i && wbs_stb_i; 
  assign wstrb = wbs_sel_i & {4{wbs_we_i}};
  assign wbs_dat_o = rdata;
  assign wdata = wbs_dat_i;

  // IRQ
  assign irq = 3'b000;	// Unused

  // LA
  assign la_data_out = {{(127-BITS){1'b0}}, count};
  // Assuming LA probes [63:32] are for controlling the count register  
  assign la_write = ~la_oenb[63:32] & ~{BITS{valid}};
  // Assuming LA probes [65:64] are for controlling the count clk & reset  
  assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
  assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;
  
  counter #(
    .BITS(BITS)
  ) counter(
    .clk(clk),
    .reset(rst),
    .ready(wbs_ack_o),
    .valid(valid),
    .rdata(rdata),
    .wdata(wbs_dat_i),
    .wstrb(wstrb),
    .la_write(la_write),
    .la_input(la_data_in[63:32]),
    .count(count)
  );
  
  wire [`MPRJ_IO_PADS-1:0] io_in;
  wire [`MPRJ_IO_PADS-1:0] io_out;
  wire [`MPRJ_IO_PADS-1:0] io_oeb;
  
  wire [1:0] mode = io_in[37:36];
  
  Minx16Top cpu16 (
      .clk_i       (io_in [33])
    , .rst_i       (io_in [32])
    
    , .dbus_ADBus_i(io_in [31:16])
    , .dbus_ADBus_o(io_out[31:16])
    , .dbus_ADBus_e(io_oeb[31:16])
    , .dbus_ale_o  (io_out[15])
    , .dbus_ale_e  (io_oeb[15])
    , .dbus_dle_o  (io_out[14])
    , .dbus_dle_e  (io_oeb[14])
    , .dbus_stb_o  (io_out[13:12])
    , .dbus_stb_e  (io_oeb[13:12])
    , .dbus_rd_o   (io_out[11])
    , .dbus_rd_e   (io_oeb[11])
    , .dbus_wr_o   (io_out[10])
    , .dbus_wr_e   (io_oeb[10])
    , .dbus_rdy_i  (io_in [9])
    
    , .dbus_req_i  (io_in [8])
    , .dbus_ack_o  (io_out[7])
    
    , .intr_i      (io_in [6])
    , .inta_o      (io_out[5])
    , .nmir_i      (io_in [34])
    , .nmia_o      (io_out[35])
  );
  
endmodule

(* blackbox *)
module Minx16Top (
  input              clk_i
, input              rst_i

, input       [15:0] dbus_ADBus_i
, output wire [15:0] dbus_ADBus_o
, output wire [15:0] dbus_ADBus_e
, output wire        dbus_ale_o
, output wire        dbus_ale_e
, output wire        dbus_dle_o
, output wire        dbus_dle_e
, output wire [ 1:0] dbus_stb_o
, output wire [ 1:0] dbus_stb_e
, output wire        dbus_rd_o
, output wire        dbus_rd_e
, output wire        dbus_wr_o
, output wire        dbus_wr_e
, input              dbus_rdy_i

, input              dbus_req_i
, output wire        dbus_ack_o

, input              intr_i
, output wire        inta_o
, input              nmir_i
, output wire        nmia_o
);

endmodule

module counter #(
    parameter BITS = 32
)(
    input clk,
    input reset,
    input valid,
    input [3:0] wstrb,
    input [BITS-1:0] wdata,
    input [BITS-1:0] la_write,
    input [BITS-1:0] la_input,
    output ready,
    output [BITS-1:0] rdata,
    output [BITS-1:0] count
);
    reg ready;
    reg [BITS-1:0] count;
    reg [BITS-1:0] rdata;

    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
            ready <= 0;
        end else begin
            ready <= 1'b0;
            if (~|la_write) begin
                count <= count + 1;
            end
            if (valid && !ready) begin
                ready <= 1'b1;
                rdata <= count;
                if (wstrb[0]) count[7:0]   <= wdata[7:0];
                if (wstrb[1]) count[15:8]  <= wdata[15:8];
                if (wstrb[2]) count[23:16] <= wdata[23:16];
                if (wstrb[3]) count[31:24] <= wdata[31:24];
            end else if (|la_write) begin
                count <= la_write & la_input;
            end
        end
    end

endmodule

`default_nettype wire
