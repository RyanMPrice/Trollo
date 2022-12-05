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

module WaveTblSig #(
  parameter A = 4
, parameter D = 16
) ( 
  input      [A-1:0] address
, output reg [D-1:0] sigA
, output reg [D-1:0] sigB
);
  
  always @*
    case(address)
      4'h0 : sigA = 16'h1000;
      4'h1 : sigA = 16'h0000;
      4'h2 : sigA = 16'h1000;
      4'h3 : sigA = 16'h2000;
      4'h4 : sigA = 16'h0000;
      4'h5 : sigA = 16'h2000;
      4'h6 : sigA = 16'h0400;
      4'h7 : sigA = 16'h0000;
      4'h8 : sigA = 16'h0400;
      4'h9 : sigA = 16'h1234;
      4'ha : sigA = 16'h0000;
      4'hb : sigA = 16'h1234;
      4'hc : sigA = 16'h1000;
      4'hd : sigA = 16'h1000;
      4'he : sigA = 16'h1000;
      4'hf : sigA = 16'h1000;
    endcase
  
  always @*
    case(address)
      4'h0 : sigB = 16'h0000;
      4'h1 : sigB = 16'h1000;
      4'h2 : sigB = 16'h1000;
      4'h3 : sigB = 16'h0000;
      4'h4 : sigB = 16'h2000;
      4'h5 : sigB = 16'h2000;
      4'h6 : sigB = 16'h0000;
      4'h7 : sigB = 16'h0400;
      4'h8 : sigB = 16'h0400;
      4'h9 : sigB = 16'h0000;
      4'ha : sigB = 16'h1234;
      4'hb : sigB = 16'h1234;
      4'hc : sigB = 16'h0000;
      4'hd : sigB = 16'h0000;
      4'he : sigB = 16'h0000;
      4'hf : sigB = 16'h0000;
    endcase
  
endmodule
