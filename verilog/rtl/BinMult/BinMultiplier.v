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

module BinMultiplier #( 
  parameter D = 16
) (
  input               clk
, input               rst

, input               enable
, output reg          done

, input       [D-1:0] dba
, input       [D-1:0] dbb
, output reg  [N-1:0] Y
, output wire [D-1:0] yA
, output wire [D-1:0] yB
);
  
  assign yA = Y[  D-1:0];
  assign yB = Y[2*D-1:D];
  
  localparam N = 2*D;
  
  wire [N-1:0] partial [D-1:0]; 
  genvar ii;
  generate for(ii = 0; ii < D; ii = ii + 1)
    assign partial[ii] = (dbb[ii]) ? (dba << ii) : 0;
  endgenerate
  
  always @ (posedge clk)
    if( enable )
      done = 1'b1;
    else
      done = 1'b0;
  
  integer jj;
  always @*
    begin
      Y = 0;
      for( jj = 0; jj < D; jj = jj + 1 )
        Y = Y + partial[jj];
    end
  
endmodule
