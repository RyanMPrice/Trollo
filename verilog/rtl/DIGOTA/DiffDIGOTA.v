
//Be sure to buffer the outputs before feeding back into this module
module DiffDIGOTA ( 
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
