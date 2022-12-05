
module clkgate(
  input       clk
, input       gate
, output wire gclk
);

  wire clki = ~clk;
  reg  clkp;

  assign gclk = clkp & clk;
  
  always @*
    if( clki )
      clkp <= gate;
    else
      clkp <= clkp;
  
  initial clkp = 0;
  
endmodule
