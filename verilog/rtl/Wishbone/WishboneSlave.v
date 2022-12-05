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

module WishboneSlave #(
  parameter BASE_ADDRESS = 32'h3000_0010
, parameter CNTR_ADDRESS = 32'h3000_0020
) (
// Wishbone Slave ports (WB MI A)
  input              wb_clk_i
, input              wb_rst_i
, input              wb_stb_i
, input              wb_cyc_i
, input              wb_we_i
, input       [3:0]  wb_sel_i
, input       [31:0] wb_dat_i
, input       [31:0] wb_adr_i
, output reg         wb_ack_o
, output wire        wb_stall_o
, output reg  [31:0] wb_dat_o

, input       [31:0] conf_in
, output reg  [31:0] conf_out
, output reg         conf_udp
);
  
  // WB MI A
  wire       wb_valid = wb_cyc_i &    wb_stb_i; 
  wire [3:0] wb_wstrb = wb_sel_i & {4{wb_we_i}};
  
  // Internal Stuff
  reg         [31:0] cntr;
  wire   reset       = ~wb_rst_i;
  assign wbs_stall_o = 0;
  
  always @(posedge wb_clk_i)
    begin
      if(reset)
        conf_out = 32'h0000_0000;
      else if(wb_stb_i && wb_cyc_i && wb_we_i && !wb_stall_o && wb_adr_i == BASE_ADDRESS)
        begin
          conf_out[ 7: 0] = (wb_sel_i[0]) ? wb_dat_i : conf_out[ 7: 0];
          conf_out[15: 8] = (wb_sel_i[1]) ? wb_dat_i : conf_out[15: 8];
          conf_out[23:16] = (wb_sel_i[2]) ? wb_dat_i : conf_out[23:16];
          conf_out[31:24] = (wb_sel_i[3]) ? wb_dat_i : conf_out[31:24];
        end
      else
        conf_out = conf_out;
    end
  
  always @(posedge wb_clk_i)
    begin
      if(reset)
        conf_udp = 1'b0;
      else if(wb_stb_i && wb_cyc_i && wb_we_i && !wb_stall_o && wb_adr_i == BASE_ADDRESS)
        conf_udp = 1'b1;
      else
        conf_udp = 1'b0;
    end
  
  always @(posedge wb_clk_i)
    begin
      if(reset)
        cntr = 32'h0000_0000;
      else if(wb_stb_i && wb_cyc_i && wb_we_i && !wb_stall_o && wb_adr_i == CNTR_ADDRESS)
        begin
          cntr[ 7: 0] = (wb_sel_i[0]) ? wb_dat_i : cntr[ 7: 0];
          cntr[15: 8] = (wb_sel_i[1]) ? wb_dat_i : cntr[15: 8];
          cntr[23:16] = (wb_sel_i[2]) ? wb_dat_i : cntr[23:16];
          cntr[31:24] = (wb_sel_i[3]) ? wb_dat_i : cntr[31:24];
        end
      else
        cntr = cntr + 1;
    end
  
  always @(posedge wb_clk_i)
    begin
      if(wb_stb_i && wb_cyc_i && !wb_we_i && !wb_stall_o)
        case(wb_adr_i)
          BASE_ADDRESS : wb_dat_o = conf_in;
          CNTR_ADDRESS : wb_dat_o = cntr;
          default      : wb_dat_o = 32'b0;
        endcase
    end
  
  // acks
  always @(posedge wb_clk_i)
    begin
      if(reset)
        wb_ack_o = 0;
      else
        wb_ack_o = (wb_stb_i && !wb_stall_o && (wb_adr_i == BASE_ADDRESS)) || 
                   (wb_stb_i && !wb_stall_o && (wb_adr_i == CNTR_ADDRESS)) ;
    end
  
endmodule
