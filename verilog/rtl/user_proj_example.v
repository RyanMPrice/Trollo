// SPDX-FileCopyrightText: 2022 Ryan M Price
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
    inout vdd,	// User area 1 1.8V supply
    inout vss,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,
    
    // Logic Analyzer Signals
    input  [63:0] la_data_in,
    output [63:0] la_data_out,
    input  [63:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq
);
  
  WishboneSlave #(
      .BASE_ADDRESS(32'h3000_0010)
    , .CNTR_ADDRESS(32'h3000_0020)
  ) wishSlave (
      .wb_clk_i  (wb_clk_i)
    , .wb_rst_i  (wb_rst_i)
    , .wb_stb_i  (wbs_stb_i)
    , .wb_cyc_i  (wbs_cyc_i)
    , .wb_we_i   (wbs_we_i)
    , .wb_sel_i  (wbs_sel_i)
    , .wb_adr_i  (wbs_adr_i)
    , .wb_dat_i  (wbs_dat_i)
    , .wb_ack_o  (wbs_ack_o)
    , .wb_stall_o()
    , .wb_dat_o  (wbs_dat_o)
    
    //Signals out of slave to design
    , .conf_in   (conf)
    , .conf_out  (confo)
    , .conf_udp  (confi)
  );
  
  assign io_oeb[37]  = 1'b1;
  wire clk = io_in[37];
  assign io_oeb[36]  = 1'b1;
  wire rst = io_in[36];
  assign io_oeb[35]  = 1'b1;
  wire den = io_in[35];
  
  wire confi;
  reg [31:0] conf;
  always @ (posedge clk or negedge rst)
    if( rst == 1'b0 )
      conf = 32'hffffffff;
    else if( confi )
      conf = confo;
    else
      conf = conf;
  
  assign io_oeb[5]  = 1'b1;
  assign io_oeb[6]  = 1'b1;
  assign io_oeb[7]  = 1'b0;
  assign io_oeb[8]  = 1'b0;
  assign io_oeb[9]  = 1'b0;
  assign io_oeb[10] = 1'b0;
  //Analog  2 pins : 2 in
  //Digital 5 pins : 1 in, 4 out
  DIGOTA duuta (
      .INpb  (io_in    [5]) //Analog io_in[7]
    , .INmb  (io_in    [6]) //Analog io_in[8]
    , .oe    (den         ) //Digital
    
    , .opmos (io_out   [7]) //Digital
    , .onmos (io_out   [8]) //Digital
    , .cmpmos(io_out   [9]) //Digital
    , .cmnmos(io_out   [10]) //Digital
  );
  
  assign io_oeb[11] = 1'b1;
  assign io_oeb[12] = 1'b1;
  assign io_oeb[13] = 1'b1;
  assign io_oeb[14] = 1'b1;
  assign io_oeb[15] = 1'b0;
  assign io_oeb[16] = 1'b0;
  assign io_oeb[17] = 1'b0;
  assign io_oeb[18] = 1'b0;
  assign io_oeb[19] = 1'b0;
  assign io_oeb[20] = 1'b0;
  //Analog  2 pins : 2 in
  //Digital 9 pins : 3 in, 6 out
  DiffDigota duutb ( 
    .INpb    (io_in    [11]) //Analog io_in[11]
  , .INmb    (io_in    [12]) //Analog io_in[12]
  , .OUTp    (io_in    [13]) //Digital
  , .OUTm    (io_in    [14]) //Digital
  , .oe      (enable       ) //Digital
  
  , .ompmos  (io_out   [15]) //Digital
  , .omnmos  (io_out   [16]) //Digital
  , .oppmos  (io_out   [17]) //Digital
  , .opnmos  (io_out   [18]) //Digital
  , .cmpmos  (io_out   [19]) //Digital
  , .cmnmos  (io_out   [20]) //Digital
  );
  
  assign io_oeb[21] = 1'b1;
  assign io_oeb[22] = 1'b1;
  assign io_oeb[23] = 1'b0;
  assign io_oeb[24] = 1'b0;
  clkmux2 tmux (
      .clka  (clk       )
    , .clkb  (io_in [21])
    , .select(io_in [22])
    , .gclk  (io_out[23])
  );
  
  clkgate tgate (
      .clk   (clk       )
    , .gate  (io_in [22])
    , .gclk  (io_out[24])
  );
  
  assign io_oeb[28:25] = 1'b1;
  assign io_oeb[29] = 1'b0;
  assign io_oeb[30] = 1'b0;
  assign io_oeb[31] = 1'b0;
  WavePWM dsynth ( 
      .clk     (clk      )
    , .rst     (rst      )
    
    , .enable  (enable)
    , .divSel  (io_in[28:25])
    
    , .qcos    (io_out[31])
    , .qsin    (io_out[30])
    , .qcomplex(io_out[29])
  );
  
  assign io_oeb[0]  = 1'b1;
  assign io_oeb[1]  = 1'b1;
  assign io_oeb[2]  = 1'b1;
  assign io_oeb[3]  = 1'b1;
  assign io_oeb[4]  = 1'b1;
  assign io_out[32] = conf[ 0];
  assign io_oeb[32] = conf[ 7];
  assign io_out[33] = conf[ 8];
  assign io_oeb[33] = conf[15];
  assign io_out[34] = conf[16];
  assign io_oeb[34] = conf[23];

endmodule

`default_nettype wire
