
module RegFile16 #(
  parameter A = 3
) (
  input               clk
, input               rst

, input       [A-1:0] ra
, output reg  [ 15:0] da
, input       [A-1:0] rb
, output reg  [ 15:0] db

, input       [A-1:0] rd
, input       [ 15:0] dd
, input       [  2:0] wd
);
  
  localparam N = 2 ** A;
  reg [15:0] file [N-1:0];
  
  wire [15:0] dv = file[rd];
  reg  [15:0] df;
  always @*
    case(wd)
        3'b000 : df = dv;
        3'b001 : df = {dv[15:8], dd[ 7:0]};
        3'b010 : df = {dd[15:8], dv[ 7:0]};
        3'b011 : df = dd;
        3'b100 : df = {dv[ 7:0], dv[15:8]};
        3'b101 : df = {dv[ 7:0], dd[15:8]};
        3'b110 : df = {dd[ 7:0], dv[15:8]};
        3'b111 : df = {dd[ 7:0], dd[15:8]};
      endcase
  
  integer ii;  
  always @ (posedge clk or negedge rst)
    if( rst == 1'b0 )
      for(ii = 0; ii < N; ii = ii + 1)
        file[ii] = 16'h0000;
    else
      file[rd] = df;
  
  always @ (negedge clk)
    da = file[ra];
  
  always @ (negedge clk)
    db = file[rb];
  
endmodule
