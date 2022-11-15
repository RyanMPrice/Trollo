
module Alu (
  input       [ 3:0] op
, input       [15:0] dba
, input       [15:0] dbb
, input              ci
, input              op8

, output reg  [15:0] Y

, output wire        Co
, output wire        Zo
, output wire        Vo
, output wire        No
);
    
  reg C;
  assign C8  = (( dba[7]  &  dbb[7])  &  Y[7]  ) | 
               (( dba[7]  ^  dbb[7])  & ~Y[7]  ) | 
               ((~dba[7]  & ~dbb[7])  &  Y[7]  ) ; 
  assign C16 = C; 
  assign Z16 = Y == 0;
  assign Z8  = Y[7:0] == 0;
  assign N16 = Y[15];
  assign N8  = Y[7];
  assign V16 = (~Y[15]&dba[15]&dbb[15]) | (Y[15]&(~dba[15])&(~dbb[15]));
  assign V8  = (~Y[7] &dba[7] &dbb[7])  | (Y[7] &(~dba[7]) &(~dbb[7]));
  
  assign Co = (op8) ? C8 : C16;
  assign Zo = (op8) ? Z8 : Z16;
  assign No = (op8) ? N8 : N16;
  assign Vo = (op8) ? V8 : V16;
  
  always @*
    case(op)
      4'b0000 : {C, Y} = {1'b0,  16'd0};
      4'b0001 : {C, Y} = {1'b0,  dba};
      4'b0010 : {C, Y} =         dba + 1'b1;
      4'b0011 : {C, Y} =         dba - 1'b1;
      4'b0100 : {C, Y} =         dba + dbb + 1'b0;
      4'b0101 : {C, Y} =         dba + dbb + ci;
      4'b0110 : {C, Y} =         dba - dbb - 1'b0;
      4'b0111 : {C, Y} =         dba - dbb - ci;
      4'b1000 : {C, Y} = {1'b0, ~dba};
      4'b1001 : {C, Y} = {1'b0,  dba & dbb};
      4'b1010 : {C, Y} = {1'b0,  dba | dbb};
      4'b1011 : {C, Y} = {1'b0,  dba ^ dbb};
      4'b1100 : {C, Y} = {dba,    1'b0};
      4'b1101 : {C, Y} = {dba[0], 1'b0, dba[15:1]};
      4'b1110 : {C, Y} = {dba,    ci};
      4'b1111 : {C, Y} = {dba[0], ci, dba[15:1]};
    endcase

endmodule
