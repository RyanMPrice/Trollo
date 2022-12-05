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

//Be sure to buffer the outputs before feeding back into this module
module DiffDigota ( 
  input INpb
, input INmb
, input OUTp
, input OUTm
, input oe

, output wire ompmos
, output wire omnmos
, output wire oppmos
, output wire opnmos
, output wire cmpmos
, output wire cmnmos
);

  wire INp = ~INpb;
  wire INm = ~INmb;
  
  assign cmpmos = ~oe | (INp | INm);
  assign cmnmos =  oe & (INp & INm);
  
  assign ompmos =  oe & ~(( ~(OUTp & INmb) & ~(OUTm & INmb)) & INpb);
  assign omnmos =  oe & ~( ~((OUTp & OUTm) &    INp) & ~(INp & INmb));
  assign oppmos = ~oe | ~(( ~(OUTp & INpb) & ~(OUTm & INpb)) & INmb);
  assign opnmos = ~oe | ~( ~((OUTp & OUTm) &    INm) & ~(INm & INpb));
  
endmodule
