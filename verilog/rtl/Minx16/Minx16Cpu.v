
module Minx16Cpu (
  input              clk_i
, input              rst_i

, output wire [15:0] dbus_Addr_o
, output wire [15:0] dbus_Addr_e
, input       [15:0] dbus_Data_i
, output wire [15:0] dbus_Data_o
, output wire [15:0] dbus_Data_e
, output wire [ 1:0] dbus_stb_o
, output wire [ 1:0] dbus_stb_e
, output wire        dbus_rd_o
, output wire        dbus_rd_e
, output wire        dbus_wr_o
, output wire        dbus_wr_e
, input              dbus_rdy_i

, input              dbus_req_i
, output wire        dbus_ack_o

, input              intr_i
, output wire        inta_o
, input              nmir_i
, output wire        nmia_o
);
  
  wire clk = clk_i;
  wire rst = rst_i;
  
  reg  [15:0] databus;
  reg  [15:0] core_Addr;
  wire [15:0] core_Data_o;
  wire        core_rd16;
  wire        core_rd8;
  wire [ 1:0] core_wr;
  wire        core_rdy;
  wire        core_done;
  
  wire [15:0] wpc, pc, sp, ir;
  wire [15:0] alu;
  wire        ldIr;
  wire        ldSp;
  wire        incSp;
  wire        decSp;
  wire        ldPc;
  wire        incPc;
  wire [ 2:0] addrSel;
  wire [ 2:0] dataSel;
  wire [ 2:0] ra, rb;
  wire [15:0] da, db;
  wire [ 2:0] rd, wd;
  wire [ 3:0] aluOp;
  wire [ 3:0] flagCond;
  wire        flagSave;
  wire [ 2:0] trapSel;
  wire        Ci, Co, Zo, No, Vo, op8, status;
  
  //Nothing trapping this build iteration
  wire trap = 1'b0;
  wire trapa;
  
  Biu1616 busUnit (
      .clk(clk)
    , .rst(rst)
    
    , .core_Addr_i(core_Addr  )
    , .core_Data_i(databus    )
    , .core_Data_o(core_Data_o)
    , .core_rd16  (core_rd16  )
    , .core_rd8   (core_rd8   )
    , .core_wr    (core_wr    )
    , .core_rdy   (core_rdy   )
    , .core_done  (core_done  )

    , .bus_Addr_o (dbus_Addr_o)
    , .bus_Addr_e (dbus_Addr_e)
    , .bus_Data_i (dbus_Data_i)
    , .bus_Data_o (dbus_Data_o)
    , .bus_Data_e (dbus_Data_e)
    , .bus_stb_o  (dbus_stb_o )
    , .bus_stb_e  (dbus_stb_e )
    , .bus_rd_o   (dbus_rd_o  )
    , .bus_rd_e   (dbus_rd_e  )
    , .bus_wr_o   (dbus_wr_o  )
    , .bus_wr_e   (dbus_wr_e  )
    , .bus_rdy_i  (dbus_rdy_i )
    
    , .bus_req_i  (dbus_req_i )
    , .bus_ack_o  (dbus_ack_o )
  );
  
  Alu computationCenter (
      .op (aluOp)
    , .dba(da)
    , .dbb(db)
    , .ci (Ci)
    , .op8(op8)
    , .Y  (alu)
    , .Co (Co)
    , .Zo (Zo)
    , .Vo (Vo)
    , .No (No)
  );
  
  RegFile16 #(3) cpuRegs (
      .clk(clk)
    , .rst(rst)
    
    , .ra(ra)
    , .da(da)
    
    , .rb(rb)
    , .db(db)
    
    , .rd(rd)
    , .dd(databus)
    , .wd(wd)
  );
  
  StackPointer #(16) spReg (
      .clk(clk)
    , .rst(rst)
    
    , .LD(ldSp)
    , .INC(incSp)
    , .DEC(decSp)
    , .D(databus)
    , .Q(sp)
  );
  
  ProgramCounter #(16) pcReg (
      .clk(clk)
    , .rst(rst)
    
    , .LD(ldPc)
    , .INC(incPc)
    , .D(databus)
    , .Q(pc)
  );
  
  Register #(16) irReg (
      .clk(clk)
    , .rst(rst)
    
    , .LD(ldIr)
    , .D(databus)
    , .Q(ir)
  );
  
  FlagRegister frReg (
      .clk(clk)
    , .rst(rst)
    
    , .flagCond(flagCond)
    , .status  (status)
    , .LD      (flagSave)
    , .flagRest(flagRest)
    , .Ci      (Co)
    , .Ni      (No)
    , .Vi      (Vo)
    , .Zi      (Zo)
    
    , .Cbk     (databus[3])
    , .Zbk     (databus[2])
    , .Nbk     (databus[1])
    , .Vbk     (databus[0])
    , .Co      (Ci)
    , .Zo      (Zi)
    , .No      (Ni)
    , .Vo      (Vi)
  );
  
  Controller brain (
    .clk(clk)
  , .rst(rst)
  
  , .trap        (trap)
  , .trapa       (trapa)
  , .intr_i      (intr_i)
  , .inta        (inta_o)
  , .nmir        (nmir_i)
  , .nmia        (nmia_o)
  
  , .ir(ir)
  , .status(status)
  , .done(core_done | 1'b0 ) // Combinatorial (misinterpretation) of icarus verilog.. seems to break all if two fsms
                             // communcate with each other. this shouldn't fix it but it does.. LOL
  
  , .ldIr (ldIr)
  , .ldSp (ldSp)
  , .incSp(incSp)
  , .decSp(decSp)
  , .ldPc (ldPc)
  , .incPc(incPc)
  
  , .rd16    (core_rd16)
  , .rd8     (core_rd8 )
  , .wr      (core_wr  )
  
  , .addrSel (addrSel)
  , .dataSel (dataSel)
  , .ra      (ra)
  , .rb      (rb)
  , .rd      (rd)
  , .wd      (wd)
  , .aluop   (aluOp)
  , .op8     (op8)
  , .flagCond(flagCond)
  , .flagRest(flagRest)
  , .flagSave(flagSave)
  , .trapSel (trapSel )
  );
  
  always @*
    case(addrSel)
      3'b000 : core_Addr = pc;
      3'b001 : core_Addr = pc;
      3'b010 : core_Addr = da; //Register?
      3'b011 : core_Addr = db; 
      3'b100 : core_Addr = pc + da; 
      3'b101 : core_Addr = sp; 
      3'b110 : core_Addr = 16'h0001; 
      3'b111 : core_Addr = 16'h0000; 
    endcase
  
  trapAddr trapHandles(
    .trapSel(trapSel)
  , .pc(pc)
  , .cpc(wpc)
  );
  
  //dataMux datMux(databus, dataSel, core_Data_o, alu, pc, da);
  always @*
    case(dataSel)
      3'b000 : databus = core_Data_o;
      3'b001 : databus = alu;
      3'b010 : databus = wpc;
      3'b011 : databus = da;
      3'b100 : databus = {12'h000, Ci, Zi, Ni, Vi};
      3'b101 : databus = {{8{core_Data_o[7]}}, core_Data_o[7:0] };
      3'b110 : databus = {   ir[7:0], ir[7:0]};
      3'b111 : databus = {{8{ir[7]}}, ir[7:0]}; //Sign extend
    endcase

endmodule
