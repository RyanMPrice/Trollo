
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
