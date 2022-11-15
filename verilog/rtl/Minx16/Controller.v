
module Controller (
  input              clk
, input              rst

, input              intr_i
, output reg         inta
, input              nmir
, output reg         nmia
, input              trap
, output reg         trapa

, input       [15:0] ir
, input              status
, input              done

, output reg         ldIr
, output reg         ldSp
, output reg         incSp
, output reg         decSp
, output reg         ldPc
, output reg         incPc

, output reg         rd16
, output reg         rd8
, output reg  [ 1:0] wr

, output reg  [ 2:0] addrSel
, output reg  [ 2:0] dataSel
, output reg  [ 2:0] trapSel
, output reg  [ 2:0] ra
, output reg  [ 2:0] rb
, output reg  [ 2:0] rd
, output reg  [ 2:0] wd
, output reg  [ 3:0] aluop
, output reg  [ 3:0] flagCond
, output reg         flagSave
, output reg         flagRest
, output reg         op8
);
  
  reg  irqA = 0;
  wire intr = intr_i & irqA;
  reg dbg_invalidop = 0;
  
  // [15:13] [12:9][8:6][5:3][2:0] ALU16   with top bits == 3'b000? alu 16 bit
  // [15:13] [12:9][8:6][5:3][2:0] ALU16   with top bits == 3'b001? alu 8h bit
  // [15:13] [12:9][8:6][5:3][2:0] ALU16   with top bits == 3'b010? alu 8l bit
  // [15:13] [12:9][8:6][5:3][2:0] MEMORY  with top bits == 3'b011? alu slot can diff read/write, 16 or 8 bit
  // [15:13] [12:9][8:6][5:3][2:0] JUMP    with top bits == 3'b100? alu slot can diff conditions
  // [15:13] [12:9][8:6][5:3][2:0] FREE    with top bits == 3'b1xx? 
  
  wire [2:0] majorOp = ir[15:13];
  wire [3:0] minorOp = ir[12: 9];
  
  reg [3:0] pstate, nstate;
  always @ (posedge clk or negedge rst)
    if( rst == 1'b0 )
      pstate = 0;
    else
      pstate = nstate;
  
  always @*
    begin
      if( rst == 1'b0 )
        irqA = 0;
      dbg_invalidop = 1'b0;
      inta          = 1'b0;
      nmia          = 1'b0;
      trapa         = 1'b0;
      trapSel       = 3'b000;
      
      ldIr          = 1'b0;
      ldSp          = 1'b0;
      incSp         = 1'b0;
      decSp         = 1'b0;
      ldPc          = 1'b0;
      incPc         = 1'b0;
      op8           = 1'b0;
      
      rd16          = 1'b0;
      rd8           = 1'b0;
      wr            = 2'b00;
      
      addrSel       = 3'b000;
      dataSel       = 3'b000;
      ra            = 3'b000;
      rb            = 3'b000;
      rd            = 3'b000;
      wd            = 3'b000;
      aluop         = 4'b0000;
      flagCond      = 1'b0;
      flagSave      = 1'b0;
      flagRest      = 1'b0;
      case(pstate)
        4'b0000 : begin
                    addrSel = 3'b000;
                    rd16    = 1'b1;
                    ldIr    = 1'b1;
                    incPc   = done;
                    if( done == 1'b1 )
                      nstate = 4'b0001;
                    else
                      nstate = 4'b0000;
                  end
        4'b0001 : begin
                    nstate = 4'b1111;
                    case(majorOp)
                      3'b000 : begin //Alu 16 bit
                                 flagSave = 1'b1;
                                 dataSel  = 3'b001;
                                 aluop    = minorOp;
                                 ra       = ir[ 8:6];
                                 rb       = ir[ 5:3];
                                 rd       = ir[ 2:0];
                                 wd       = 3'b011;
                                 nstate   = 4'b1111;
                               end
                      3'b001 : begin //Alu 8 bit high
                                 flagSave = 1'b1;
                                 dataSel  = 3'b001;
                                 aluop    = minorOp;
                                 ra       = ir[ 8:6];
                                 rb       = ir[ 5:3];
                                 rd       = ir[ 2:0];
                                 wd       = 3'b010;
                                 nstate   = 4'b1111;
                               end
                      3'b010 : begin //Alu 8 bit low
                                 flagSave = 1'b1;
                                 dataSel  = 3'b001;
                                 aluop    = minorOp;
                                 ra       = ir[ 8:6];
                                 rb       = ir[ 5:3];
                                 rd       = ir[ 2:0];
                                 wd       = 3'b001;
                                 op8      = 1'b1;
                                 nstate   = 4'b1111;
                               end
                      3'b011 : begin //Memory operations
                                 nstate = 4'b1111;
                                 case(minorOp)
                                   4'b0000 : begin //16 bit read
                                               rd16     = 1'b1;
                                               ra       = ir[8:6];
                                               rb       = ir[5:3];
                                               rd       = ir[2:0];
                                               wd       = 3'b011;
                                               dataSel  = 3'b000;
                                               addrSel  = ir[5:3];
                                               if( done )
                                                 nstate = 4'b1111;
                                               else
                                                 nstate = 4'b0001;
                                             end
                                   4'b0001 : begin //16 bit write
                                               wr       = 2'b11;
                                               rb       = ir[5:3];
                                               ra       = ir[2:0];
                                               dataSel  = 3'b011;
                                               addrSel  = ir[8:6];
                                               if( done )
                                                 nstate = 4'b1111;
                                               else
                                                 nstate = 4'b0001;
                                             end
                                   4'b0010 : begin //8 bit read low
                                               rd8      = 1'b1;
                                               ra       = ir[8:6];
                                               rb       = ir[5:3];
                                               rd       = ir[2:0];
                                               wd       = 3'b001;
                                               dataSel  = 3'b000;
                                               addrSel  = ir[5:3];
                                               if( done )
                                                 nstate = 4'b1111;
                                               else
                                                 nstate = 4'b0001;
                                             end
                                   4'b0011 : begin //8 bit write low
                                               wr       = 2'b01;
                                               rb       = ir[5:3];
                                               ra       = ir[2:0];
                                               dataSel  = 3'b011;
                                               addrSel  = ir[8:6];
                                               if( done )
                                                 nstate = 4'b1111;
                                               else
                                                 nstate = 4'b0001;
                                             end
                                   4'b0100 : begin //8 bit read high
                                               rd8      = 1'b1;
                                               ra       = ir[8:6];
                                               rb       = ir[5:3];
                                               rd       = ir[2:0];
                                               wd       = 3'b110;
                                               dataSel  = 3'b000;
                                               addrSel  = ir[5:3];
                                               if( done )
                                                 nstate = 4'b1111;
                                               else
                                                 nstate = 4'b0001;
                                             end
                                   4'b0101 : begin //8 bit write high
                                               wr       = 2'b10;
                                               rb       = ir[5:3];
                                               ra       = ir[2:0];
                                               dataSel  = 3'b011;
                                               addrSel  = ir[8:6];
                                               if( done )
                                                 nstate = 4'b1111;
                                               else
                                                 nstate = 4'b0001;
                                             end
                                   4'b0110 : begin //8 Bit read and save sign extend
                                               rd8      = 1'b1;
                                               ra       = ir[8:6];
                                               rb       = ir[5:3];
                                               rd       = ir[2:0];
                                               wd       = 3'b011;
                                               dataSel  = 3'b101;
                                               addrSel  = ir[5:3];
                                               if( done )
                                                 nstate = 4'b1111;
                                               else
                                                 nstate = 4'b0001;
                                             end
                                   4'b0111 : begin //Load 8 bit sign extended immediate into register
                                               rd      = {2'b00, ir[8]};
                                               wd      = 3'b011;
                                               dataSel = 3'b111;
                                               nstate  = 4'b1111;
                                             end
                                   4'b1000 : begin //8 Bit immediate load
                                               rd      = ir[10:8];
                                               wd      = {1'b0, ir[11], ~ir[11]};
                                               dataSel = 3'b110;
                                               nstate  = 4'b1111;
                                             end
                                   4'b1001 : begin
                                               rd      = ir[10:8];
                                               wd      = {1'b0, ir[11], ~ir[11]};
                                               dataSel = 3'b110;
                                               nstate  = 4'b1111;
                                             end
                                   4'b1010 : begin
                                               rd      = ir[10:8];
                                               wd      = {1'b0, ir[11], ~ir[11]};
                                               dataSel = 3'b110;
                                               nstate  = 4'b1111;
                                             end
                                   4'b1011 : begin
                                               rd      = ir[10:8];
                                               wd      = {1'b0, ir[11], ~ir[11]};
                                               dataSel = 3'b110;
                                               nstate  = 4'b1111;
                                             end
                                   4'b1100 : begin
                                               rd      = ir[10:8];
                                               wd      = {1'b0, ir[11], ~ir[11]};
                                               dataSel = 3'b110;
                                               nstate  = 4'b1111;
                                             end
                                   4'b1101 : begin
                                               rd      = ir[10:8];
                                               wd      = {1'b0, ir[11], ~ir[11]};
                                               dataSel = 3'b110;
                                               nstate  = 4'b1111;
                                             end
                                   4'b1110 : begin
                                               rd      = ir[10:8];
                                               wd      = {1'b0, ir[11], ~ir[11]};
                                               dataSel = 3'b110;
                                               nstate  = 4'b1111;
                                             end
                                   4'b1111 : begin
                                               rd      = ir[10:8];
                                               wd      = {1'b0, ir[11], ~ir[11]};
                                               dataSel = 3'b110;
                                               nstate  = 4'b1111;
                                             end
                                 endcase
                               end
                      3'b100 : begin //Jump and Call
                                 flagCond     = minorOp;
                                 if( ir[8] ) //Call instruction
                                   begin
                                     if( status )
                                       begin
                                         //Save PC
                                         wr        = 2'b11;
                                         if( ~(minorOp == 4'b1111) )
                                           trapSel = 3'b111;
                                         else
                                           trapSel = 3'b000;
                                         dataSel   = 3'b010; 
                                         addrSel   = 3'b101;
                                         decSp     = done;
                                         if( done )
                                           nstate  = 4'b1000;
                                         else
                                           nstate  = 4'b0001;
                                       end
                                     else
                                       nstate  = 4'b1111;
                                   end
                                 else //Jump instruction
                                   begin
                                     if( status & ~(minorOp == 4'b1111))
                                       begin
                                         rd16     = 1'b1;
                                         dataSel  = 3'b000;
                                         addrSel  = 3'b000;
                                         ldPc     = done;
                                         if( done )
                                           nstate = 4'b1111;
                                         else
                                           nstate = 4'b0001;
                                       end
                                     else if( status & (minorOp == 4'b1111))
                                       begin
                                         ra       = ir[7:5];
                                         dataSel  = 3'b011;
                                         ldPc     = 1'b1;
                                         nstate   = 4'b1111;
                                       end
                                     else
                                       begin
                                         incPc  = 1'b1;
                                         nstate = 4'b1111;
                                       end
                                   end
                               end
                      3'b101 : begin //Call
                                 nstate = 4'b1111;
                               end
                      3'b110 : begin //Free
                                 nstate = 4'b1111;
                               end
                      3'b111 : begin //Special Operations
                                 nstate = 4'b1111;
                                 case(minorOp)
                                   4'b0000 : begin //Load SP
                                               if( ir[8] == 1'b1 )
                                                 begin
                                                   ldSp    = 1'b1;
                                                   dataSel = 3'b111;
                                                   nstate  = 4'b1111;
                                                 end
                                               else
                                                 begin
                                                   rd16     = 1'b1;
                                                   dataSel  = 3'b000;
                                                   addrSel  = 3'b000;
                                                   ldSp     = 1'b1;
                                                   incPc    = done;
                                                   if( done )
                                                     nstate = 4'b1111;
                                                   else
                                                     nstate = 4'b0001;
                                                 end
                                             end
                                   4'b0001 : begin //Set Flag
                                               if( ir[8] == 1'b1 )
                                                 irqA  = 1'b1;
                                               else
                                                 irqA  = 1'b0;
                                               nstate  = 4'b1111;
                                             end
                                   4'b1110 : begin //return from interrupt
                                               flagCond   = ir[7:4];
                                               if( status )
                                                 begin
                                                   incSp  = 1'b1;
                                                   nstate = 4'b1010; //Load Flags from stack then PC
                                                 end
                                               else
                                                 begin
                                                   nstate = 4'b1111;
                                                 end
                                             end
                                   4'b1111 : begin //return
                                               flagCond   = ir[7:4];
                                               if( status )
                                                 begin
                                                   incSp  = 1'b1;
                                                   nstate = 4'b1001; //Load PC from stack
                                                 end
                                               else
                                                 begin
                                                   nstate = 4'b1111;
                                                 end
                                             end
                                   default : nstate = 4'b1111;
                                 endcase
                               end
                    endcase
                  end
        4'b0010 : begin // jump operation
                    nstate = 4'b1111;
                  end
        4'b0011 : begin
                    nstate = 4'b1111;
                  end
        4'b0100 : begin
                    nstate = 4'b1111;
                  end
        4'b0101 : begin
                    nstate = 4'b1111;
                  end
        4'b0110 : begin
                    nstate = 4'b1111;
                  end
        4'b1000 : begin // Finish Call by loading PC from selected destination
                    if( ~(minorOp == 4'b1111))
                      begin
                        rd16     = 1'b1;
                        dataSel  = 3'b000;
                        addrSel  = 3'b000;
                        ldPc     = done;
                        if( done )
                          nstate = 4'b1111;
                        else
                          nstate = 4'b1000;
                      end
                    else if(minorOp == 4'b1111)
                      begin
                        ra       = ir[7:5];
                        dataSel  = 3'b011;
                        ldPc     = 1'b1;
                        nstate   = 4'b1111;
                      end
                    else
                      begin
                        incPc  = 1'b1;
                        nstate = 4'b1111;
                      end
                  end
        4'b1001 : begin  //Read from stack PC
                    rd16    = 1'b1;
                    ldPc    = 1'b1;
                    addrSel = 3'b101;
                    dataSel = 3'b000;
                    if( done )
                      nstate = 4'b1111;
                    else
                      nstate = 4'b1001;
                  end
        4'b1010 : begin  //Read from stack PC
                    rd16    = 1'b1;
                    ldPc    = 1'b1;
                    addrSel = 3'b101;
                    dataSel = 3'b000;
                    if( done )
                      nstate = 4'b1011;
                    else
                      nstate = 4'b1010;
                  end
        4'b1011 : begin  //Read from stack Flags
                    rd16     = 1'b1;
                    flagRest = 1'b1;
                    addrSel  = 3'b101;
                    dataSel  = 3'b000;
                    incSp    = done;
                    if( done )
                      nstate = 4'b1111;
                    else
                      nstate = 4'b1011;
                  end
        4'b1100 : begin //Interrupts! Save PC
                    trapSel  = 3'b000;
                    wr       = 2'b11;
                    dataSel  = 3'b010; 
                    addrSel  = 3'b101;
                    decSp    = done;
                    if( done )
                      nstate = 4'b1101;
                    else
                      nstate = 4'b1100;
                  end
        4'b1101 : begin //Load PC
                    dataSel  = 3'b010; 
                    addrSel  = 3'b101;
                    if     ( trap == 1'b1 )
                      trapSel  = 3'b001;
                    else if( nmir == 1'b1 )
                      trapSel  = 3'b010;
                    else if( intr == 1'b1 )
                      trapSel  = 3'b011;
                    else
                      trapSel  = 3'b000;
                    nstate   = 4'b1110;
                  end
        4'b1110 : begin //Load PC
                    ldPc  = 1'b1;
                    dataSel  = 3'b010; 
                    addrSel  = 3'b101;
                    if     ( trap == 1'b1 )
                      begin
                        trapSel  = 3'b001;
                        trapa    = 1'b1;
                      end
                    else if( nmir == 1'b1 )
                      begin
                        trapSel  = 3'b010;
                        nmia     = 1'b1;
                      end
                    else if( intr == 1'b1 )
                      begin
                        trapSel  = 3'b011;
                        inta     = 1'b1;
                      end
                    else
                      trapSel  = 3'b000;
                    nstate   = 4'b0000;
                  end
        4'b1111 : begin //Int ack
                    if( trap == 1'b1 | nmir == 1'b1 | intr == 1'b1 )
                      begin
                        wr       = 2'b11;
                        trapSel  = 3'b000;
                        dataSel  = 3'b100; 
                        addrSel  = 3'b101;
                        decSp    = done;
                        if( done )
                          nstate = 4'b1100;
                        else
                          nstate = 4'b1111;
                      end
                    else
                      nstate = 4'b0000;
                  end
        default : nstate = 4'b0000;
      endcase
    end
  
endmodule
