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

module clkmux2 (
  input       clka
, input       clkb

, input       select

, output wire gclk
);
  
  wire selecta =  select;
  wire selectb = ~select; 
  
  reg  clkpaa, clkpab;
  reg  clkpba, clkpbb;
  
  wire clkapa = ~select & ~clkpbb;
  wire clkbpb =  select & ~clkpab;
  wire clkab  =  clka   &  clkpab;
  wire clkbb  =  clkb   &  clkpbb;
  assign gclk =  clkab  |  clkbb;
  
  always @ (posedge clka)
    clkpaa <= clkapa;
  always @ (posedge clka)
    clkpab <= clkpaa;

  always @ (posedge clkb)
    clkpba <= clkbpb;
  always @ (posedge clkb)
    clkpbb <= clkpba;
  
  initial clkpaa = 0;
  initial clkpab = 0;
  initial clkpba = 0;
  initial clkpbb = 0;
  
endmodule
