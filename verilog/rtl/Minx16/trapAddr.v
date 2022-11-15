
module trapAddr #(
  parameter A = 16
) (
  input       [  2:0] trapSel
, input       [A-1:0] pc
, output reg  [A-1:0] cpc
);

  always @*
    case(trapSel)
      3'b000 : cpc = pc;
      3'b001 : cpc = 16'h0400;
      3'b010 : cpc = 16'h0800;
      3'b011 : cpc = 16'h0c00;
      3'b100 : cpc = 16'h0000;
      3'b101 : cpc = 16'h0000;
      3'b110 : cpc = 16'h0000;
      3'b111 : cpc = pc + 2'd2;
    endcase

endmodule
