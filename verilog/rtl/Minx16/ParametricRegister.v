
module Register #( 
  parameter W = 8
) (
  input              clk
, input              rst

, input              LD
, input      [W-1:0] D
, output reg [W-1:0] Q
);

  initial Q = 0;
  
  always @ (posedge clk or negedge rst)
    begin
        if( rst == 1'b0 )
          Q <= 0;
        else if (LD == 1'b1)
          Q <= D;
        else
          Q <= Q;
    end

endmodule
