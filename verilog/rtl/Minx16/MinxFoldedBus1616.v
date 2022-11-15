
module MinxFoldedBus1616 (
  input               clk_i
, input               rst_i

//Core side
, input       [A-1:0] core_Addr_i
, input       [D-1:0] core_Data_i
, output reg  [D-1:0] core_Data_o
, input       [B-1:0] core_stb_i
, input               core_rd_i
, input               core_wr_i
, output reg          core_rdy_o

//Scratchpad Memory
, output reg  [A-1:0] scb_Addr_o
, input       [D-1:0] scb_Data_i
, output reg  [D-1:0] scb_Data_o
, output reg  [B-1:0] scb_stb_o
, output reg          scb_ce_o
, output reg          scb_rd_o
, output reg          scb_wr_o
, input               scb_rdy_i

//Bus side with multiplexed bus
, input       [A-1:0] dbus_ADBus_i
, output reg  [D-1:0] dbus_ADBus_o
, output reg  [D-1:0] dbus_ADBus_e
, output reg          dbus_ale_o
, output reg          dbus_ale_e
, output reg          dbus_dle_o
, output reg          dbus_dle_e
, output reg  [B-1:0] dbus_stb_o
, output reg  [B-1:0] dbus_stb_e
, output reg          dbus_rd_o
, output reg          dbus_rd_e
, output reg          dbus_wr_o
, output reg          dbus_wr_e
, input               dbus_rdy_i

, input               dbus_req_i
, output reg          dbus_ack_o
);
  
  localparam SCBBASE     = 16'hF800;
  
  localparam A = 16;
  localparam D = 16;
  localparam B = 2;
  localparam BUSENABLE   = {D{1'b0}};
  localparam BUSDISABLE  = {D{1'b1}};
  
  localparam STBENABLE   = {B{1'b0}};
  localparam STBDISABLE  = {B{1'b1}};
  localparam STBACTIVE   = 1'b1;
  localparam STBINACTIVE = 1'b0;
  
  localparam ALEACTIVE   = 1'b1;
  localparam ALEINACTIVE = 1'b0;
  localparam ALEENABLE   = 1'b0;
  localparam ALEDISABLE  = 1'b1;
  
  localparam DLEACTIVE   = 1'b1;
  localparam DLEINACTIVE = 1'b0;
  localparam DLEENABLE   = 1'b0;
  localparam DLEDISABLE  = 1'b1;
  
  localparam RDACTIVE    = 1'b0;
  localparam RDINACTIVE  = 1'b1;
  localparam RDENABLE    = 1'b0;
  localparam RDDISABLE   = 1'b1;

  localparam WRACTIVE    = 1'b0;
  localparam WRINACTIVE  = 1'b1;
  localparam WRENABLE    = 1'b0;
  localparam WRDISABLE   = 1'b1;
  
  wire rdActive = core_rd_i == RDACTIVE;
  wire wrActive = core_wr_i == WRACTIVE;
  wire  scb_cen = (core_Addr_i >= SCBBASE && core_Addr_i < SCBBASE + 2**(9+2));
  
  reg [3:0] pstate, nstate;
  always @ (posedge clk_i or negedge rst_i)
    if( rst_i == 1'b0 )
      pstate <= 0;
    else
      pstate <= nstate;
  
  always @*
    begin
      dbus_ADBus_o = 0;
      dbus_ADBus_e = BUSENABLE;
      dbus_ale_o   = ALEINACTIVE;
      dbus_ale_e   = ALEENABLE;
      dbus_dle_o   = DLEINACTIVE;
      dbus_dle_e   = DLEENABLE;
      dbus_stb_o   = STBINACTIVE;
      dbus_stb_e   = STBENABLE;
      dbus_rd_o    = RDINACTIVE;
      dbus_rd_e    = RDENABLE;
      dbus_wr_o    = WRINACTIVE;
      dbus_wr_e    = WRENABLE;
      dbus_ack_o   = 1'b0;
      core_rdy_o   = 1'b0;
      
      scb_Addr_o   = {A{1'b0}};
      scb_Data_o   = {D{1'b0}};
      scb_ce_o     = 1'b0;
      scb_stb_o    = {B{STBINACTIVE}};
      scb_rd_o     = RDINACTIVE;
      scb_wr_o     = WRINACTIVE;
      
      case(pstate)
        4'b0000 : begin
                   core_Data_o  = 0;
                 end
        4'b0001 : begin
                   dbus_ADBus_e = BUSDISABLE;
                   dbus_ale_e   = ALEDISABLE;
                   dbus_dle_e   = DLEDISABLE;
                   dbus_stb_e   = STBDISABLE;
                   dbus_rd_e    = RDDISABLE;
                   dbus_wr_e    = WRDISABLE;
                   dbus_ack_o   = 1'b1;
                 end
        4'b0010 : begin
                   dbus_ADBus_o = core_Addr_i;
                   dbus_stb_o   = {B{STBACTIVE}};
                   dbus_ale_o   = ALEINACTIVE;
                 end
        4'b0011 : begin
                   dbus_ADBus_o = core_Addr_i;
                   dbus_stb_o   = {B{STBACTIVE}};
                   dbus_ale_o   = ALEACTIVE;
                 end
        4'b0100 : begin
                   dbus_ADBus_o = core_Addr_i;
                   dbus_stb_o   = {B{STBACTIVE}};
                   dbus_ale_o   = ALEINACTIVE;
                 end
        4'b0101 : begin
                   dbus_ADBus_o = core_Data_i;
                   if(~wrActive)
                     dbus_ADBus_e = BUSDISABLE;
                   dbus_dle_o   = DLEACTIVE;
                   dbus_stb_o   = core_stb_i;
                   dbus_rd_o    = RDINACTIVE;
                   dbus_wr_o    = WRINACTIVE;
                 end
        4'b0110 : begin
                   core_Data_o  = dbus_ADBus_i;
                   dbus_ADBus_o = core_Data_i;
                   if(~wrActive)
                     dbus_ADBus_e = BUSDISABLE;
                   dbus_dle_o   = DLEACTIVE;
                   dbus_stb_o   = core_stb_i;
                   dbus_rd_o    = core_rd_i;
                   dbus_wr_o    = WRINACTIVE;
                 end
        4'b0111 : begin
                   core_Data_o  = dbus_ADBus_i;
                   dbus_ADBus_o = core_Data_i;
                   if(~wrActive)
                     dbus_ADBus_e = BUSDISABLE;
                   dbus_dle_o   = DLEACTIVE;
                   dbus_stb_o   = core_stb_i;
                   dbus_rd_o    = core_rd_i;
                   dbus_wr_o    = core_wr_i;
                   core_rdy_o   = dbus_rdy_i;
                 end
        4'b1000 : begin
                   scb_Addr_o   = core_Addr_i;
                   scb_Data_o   = core_Data_i;
                   scb_ce_o     = 1'b1;
                   core_Data_o  = scb_Data_i;
                   scb_stb_o    = core_stb_i;
                   scb_rd_o     = core_rd_i;
                   scb_wr_o     = core_wr_i;
                  end
        4'b1001 : begin
                   scb_Addr_o   = core_Addr_i;
                   scb_Data_o   = core_Data_i;
                   scb_ce_o     = 1'b1;
                   core_Data_o  = scb_Data_i;
                   scb_stb_o    = core_stb_i;
                   scb_rd_o     = core_rd_i;
                   scb_wr_o     = core_wr_i;
                  end
        4'b1010 : begin
                   scb_Addr_o   = core_Addr_i;
                   scb_Data_o   = core_Data_i;
                   scb_ce_o     = 1'b1;
                   core_Data_o  = scb_Data_i;
                   scb_stb_o    = core_stb_i;
                   scb_rd_o     = core_rd_i;
                   scb_wr_o     = core_wr_i;
                   core_rdy_o   = scb_rdy_i;
                 end
      endcase
    end
  
  always @*
    begin
      nstate = 4'b0000;
      case(pstate)
        4'b0000  : begin
                     if(scb_cen & (rdActive || wrActive))
                       nstate = 4'b1000;
                     if(~scb_cen & (rdActive || wrActive))
                       nstate = 4'b0010;
                     else if( dbus_req_i )
                       nstate = 4'b0001;
                   end
        4'b0001  : if( dbus_req_i )
                     nstate = 4'b0001;
        4'b0010  : nstate   = 4'b0011;
        4'b0011  : nstate   = 4'b0100;
        4'b0100  : nstate   = 4'b0101;
        4'b0101  : nstate   = 4'b0110;
        4'b0110  : nstate   = 4'b0111;
        4'b0111  : if( dbus_rdy_i )
                     nstate = 4'b0000;
                   else
                     nstate = 4'b0111;
        4'b1000  : nstate = 4'b1001;
        4'b1001  : nstate = 4'b1010;
        4'b1010  : nstate = 4'b0000;
      endcase
    end
  
endmodule
