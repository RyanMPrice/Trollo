//////////////////////////////////////////////////
////////////cosine Wave ROM Table//////////////
//////////////////////////////////////////////////
// produces a 2's comp, 16-bit, approximation
// of a cosine wave, given an input phase (address)
module WaveTblCosSin #(
  parameter A = 8
, parameter D = 16
) (
  input [A-1:0] address
, output wire [D-1:0] cos
, output wire [D-1:0] sin
);
  
  reg  [D-1:0] cosine, sine;
  wire [A-3:0] addra = ( address[A-2] == 1'b0     )   ?  address : ~address;
  wire [A-3:0] addrb = ( address[A-2])                ? ~address :  address;
  assign       cos   = ( address[A-1] ^ address[A-2]) ? ~cosine  :  cosine;
  assign       sin   = ( address[A-1])                ? ~sine    :  sine;
  
  always @*
    case(addra)
      6'd0:  cosine = 16'd65535;
      6'd1:  cosine = 16'd65525;
      6'd2:  cosine = 16'd65495;
      6'd3:  cosine = 16'd65445;
      6'd4:  cosine = 16'd65375;
      6'd5:  cosine = 16'd65286;
      6'd6:  cosine = 16'd65177;
      6'd7:  cosine = 16'd65048;
      6'd8:  cosine = 16'd64900;
      6'd9:  cosine = 16'd64732;
      6'd10: cosine = 16'd64545;
      6'd11: cosine = 16'd64338;
      6'd12: cosine = 16'd64113;
      6'd13: cosine = 16'd63868;
      6'd14: cosine = 16'd63604;
      6'd15: cosine = 16'd63322;
      6'd16: cosine = 16'd63021;
      6'd17: cosine = 16'd62702;
      6'd18: cosine = 16'd62364;
      6'd19: cosine = 16'd62009;
      6'd20: cosine = 16'd61636;
      6'd21: cosine = 16'd61245;
      6'd22: cosine = 16'd60837;
      6'd23: cosine = 16'd60412;
      6'd24: cosine = 16'd59970;
      6'd25: cosine = 16'd59512;
      6'd26: cosine = 16'd59037;
      6'd27: cosine = 16'd58547;
      6'd28: cosine = 16'd58041;
      6'd29: cosine = 16'd57519;
      6'd30: cosine = 16'd56982;
      6'd31: cosine = 16'd56431;
      6'd32: cosine = 16'd55866;
      6'd33: cosine = 16'd55286;
      6'd34: cosine = 16'd54693;
      6'd35: cosine = 16'd54086;
      6'd36: cosine = 16'd53467;
      6'd37: cosine = 16'd52834;
      6'd38: cosine = 16'd52190;
      6'd39: cosine = 16'd51534;
      6'd40: cosine = 16'd50867;
      6'd41: cosine = 16'd50188;
      6'd42: cosine = 16'd49499;
      6'd43: cosine = 16'd48800;
      6'd44: cosine = 16'd48091;
      6'd45: cosine = 16'd47373;
      6'd46: cosine = 16'd46646;
      6'd47: cosine = 16'd45910;
      6'd48: cosine = 16'd45167;
      6'd49: cosine = 16'd44416;
      6'd50: cosine = 16'd43657;
      6'd51: cosine = 16'd42893;
      6'd52: cosine = 16'd42122;
      6'd53: cosine = 16'd41345;
      6'd54: cosine = 16'd40564;
      6'd55: cosine = 16'd39777;
      6'd56: cosine = 16'd38986;
      6'd57: cosine = 16'd38192;
      6'd58: cosine = 16'd37394;
      6'd59: cosine = 16'd36593;
      6'd60: cosine = 16'd35790;
      6'd61: cosine = 16'd34986;
      6'd62: cosine = 16'd34179;
      6'd63: cosine = 16'd33373;
    endcase
  
  always @*
    case(addrb)
      6'd0:  sine = 16'd32767;
      6'd1:  sine = 16'd33574;
      6'd2:  sine = 16'd34381;
      6'd3:  sine = 16'd35187;
      6'd4:  sine = 16'd35991;
      6'd5:  sine = 16'd36794;
      6'd6:  sine = 16'd37594;
      6'd7:  sine = 16'd38391;
      6'd8:  sine = 16'd39184;
      6'd9:  sine = 16'd39974;
      6'd10: sine = 16'd40759;
      6'd11: sine = 16'd41540;
      6'd12: sine = 16'd42315;
      6'd13: sine = 16'd43084;
      6'd14: sine = 16'd43848;
      6'd15: sine = 16'd44604;
      6'd16: sine = 16'd45353;
      6'd17: sine = 16'd46095;
      6'd18: sine = 16'd46828;
      6'd19: sine = 16'd47553;
      6'd20: sine = 16'd48269;
      6'd21: sine = 16'd48976;
      6'd22: sine = 16'd49672;
      6'd23: sine = 16'd50359;
      6'd24: sine = 16'd51035;
      6'd25: sine = 16'd51699;
      6'd26: sine = 16'd52352;
      6'd27: sine = 16'd52994;
      6'd28: sine = 16'd53623;
      6'd29: sine = 16'd54239;
      6'd30: sine = 16'd54842;
      6'd31: sine = 16'd55432;
      6'd32: sine = 16'd56008;
      6'd33: sine = 16'd56570;
      6'd34: sine = 16'd57118;
      6'd35: sine = 16'd57651;
      6'd36: sine = 16'd58168;
      6'd37: sine = 16'd58671;
      6'd38: sine = 16'd59157;
      6'd39: sine = 16'd59628;
      6'd40: sine = 16'd60082;
      6'd41: sine = 16'd60520;
      6'd42: sine = 16'd60940;
      6'd43: sine = 16'd61344;
      6'd44: sine = 16'd61731;
      6'd45: sine = 16'd62099;
      6'd46: sine = 16'd62450;
      6'd47: sine = 16'd62783;
      6'd48: sine = 16'd63098;
      6'd49: sine = 16'd63394;
      6'd50: sine = 16'd63672;
      6'd51: sine = 16'd63931;
      6'd52: sine = 16'd64171;
      6'd53: sine = 16'd64392;
      6'd54: sine = 16'd64593;
      6'd55: sine = 16'd64776;
      6'd56: sine = 16'd64939;
      6'd57: sine = 16'd65082;
      6'd58: sine = 16'd65206;
      6'd59: sine = 16'd65310;
      6'd60: sine = 16'd65395;
      6'd61: sine = 16'd65459;
      6'd62: sine = 16'd65504;
      6'd63: sine = 16'd65529;
    endcase
  
endmodule
