
module FlagRegister (
  input             clk
, input             rst

, input       [3:0] flagCond
, output reg        status

, input             LD
, input             flagRest

, input             Ci
, input             Ni
, input             Zi
, input             Vi

, input             Cbk
, input             Nbk
, input             Zbk
, input             Vbk

, output reg        Co
, output reg        No
, output reg        Zo
, output reg        Vo
);
  
  always @ (posedge clk or negedge rst)
    begin
      if( rst == 1'b0 )
        Co <= 1'b0;
      else if (LD == 1'b1)
        Co <= Ci;
      else if (flagRest == 1'b1)
        Co <= Cbk;
      else
        Co <= Co;
    end

  always @ (posedge clk or negedge rst)
    begin
      if( rst == 1'b0 )
        Vo <= 1'b0;
      else if (LD == 1'b1)
        Vo <= Vi;
      else if (flagRest == 1'b1)
        Vo <= Vbk;
      else
        Vo <= Vo;
    end

  always @ (posedge clk or negedge rst)
    begin
      if( rst == 1'b0 )
        No <= 1'b0;
      else if (LD == 1'b1)
        No <= Ni;
      else if (flagRest == 1'b1)
        No <= Nbk;
      else
        No <= No;
    end

  always @ (posedge clk or negedge rst)
    begin
      if( rst == 1'b0 )
        Zo <= 1'b0;
      else if (LD == 1'b1)
        Zo <= Zi;
      else if (flagRest == 1'b1)
        Zo <= Zbk;
      else
        Zo <= Zo;
    end
  
  //    7        5        3        1
  //({C16, C8, Z16, Z8, V16, V8, N16, N8})
  always @*
    case(flagCond)
      4'b0000 : status = 1'b0; 
      4'b0001 : status = 1'b1; 
      4'b0010 : status =   Zo; // Zero 
      4'b0011 : status =  ~Zo; //~Zero
      4'b0100 : status =   Co; // Carry
      4'b0101 : status =  ~Co; //~Carry
      4'b0110 : status =   Vo; // Overflow
      4'b0111 : status =  ~Vo; //~Overflow
      4'b1000 : status =   No; // minus 
      4'b1001 : status =  ~No; // plus 
      4'b1010 : status =         (~No & ~Vo) | ( No & Vo);  //greather than or equal 
      4'b1011 : status =         ( No & ~Vo) | (~No & Vo);  //Less than
      4'b1100 : status =  ~Zo & ((~No & ~Vo) | ( No & Vo)); // greather than 
      4'b1101 : status =   Zo & (( No & ~Vo) | (~No & Vo)); // less than or equal 
      4'b1110 : status = 1'b0;
      4'b1111 : status = 1'b1;
    endcase

  
endmodule
