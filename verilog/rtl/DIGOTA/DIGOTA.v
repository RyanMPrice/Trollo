
module DIGOTA ( 
  input INpb
, input INmb
, input oe

, output wire opmos
, output wire onmos
, output wire cmpmos
, output wire cmnmos
);

  wire INp      = ~INpb;
  wire INm      = ~INmb;
  
  assign cmpmos = ~oe | (( INp) | INm);
  assign cmnmos =  oe & (( INp) & INm);
  
  assign opmos  = ~oe | ((~INp) | INm);
  assign onmos  =  oe & ((~INp) & INm);
  
endmodule
