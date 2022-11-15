
module Minx16Top (
  input              clk_i
, input              rst_i

, input       [15:0] dbus_ADBus_i
, output wire [15:0] dbus_ADBus_o
, output wire [15:0] dbus_ADBus_e
, output wire        dbus_ale_o
, output wire        dbus_ale_e
, output wire        dbus_dle_o
, output wire        dbus_dle_e
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
  
  wire [15:0] core_Addr_i;
  wire [15:0] core_Data_i;
  wire [15:0] core_Data_o;
  wire [ 1:0] core_stb_o;
  wire        core_rd_o;
  wire        core_wr_o;
  wire        core_rdy_i;
  
  wire [15:0] scb_Addr_o;
  wire [15:0] scb_Data_i;
  wire [15:0] scb_Data_o;
  wire [ 1:0] scb_stb_o;
  wire        scb_ce_o;
  wire        scb_rd_o;
  wire        scb_wr_o;
  wire        scb_rdy_i;
  
  Minx16Cpu cpu (
    .clk_i       (clk_i)
  , .rst_i       (rst_i)
  
  , .intr_i      (intr_i)
  , .inta_o      (inta_o)
  , .nmir_i      (nmir_i)
  , .nmia_o      (nmia_o)
  
  , .dbus_Addr_o (core_Addr_i)
  , .dbus_Addr_e ()
  , .dbus_Data_i (core_Data_o)
  , .dbus_Data_o (core_Data_i)
  , .dbus_Data_e ()
  , .dbus_stb_o  (core_stb_o)
  , .dbus_stb_e  ()
  , .dbus_rd_o   (core_rd_o)
  , .dbus_rd_e   ()
  , .dbus_wr_o   (core_wr_o)
  , .dbus_wr_e   ()
  , .dbus_rdy_i  (core_rdy_i | 1'b0)
  
  , .dbus_req_i  (dbus_req_i)
  , .dbus_ack_o  ()
  );
  
  MinxFoldedBus1616 biu (
    .clk_i(clk_i)
  , .rst_i(rst_i)
  
  , .core_Addr_i(core_Addr_i)
  , .core_Data_i(core_Data_i)
  , .core_Data_o(core_Data_o)
  , .core_stb_i(core_stb_o)
  , .core_rd_i(core_rd_o)
  , .core_wr_i(core_wr_o)
  , .core_rdy_o(core_rdy_i)
  
    , .scb_Addr_o(scb_Addr_o)
    , .scb_Data_i(scb_Data_o)
    , .scb_Data_o(scb_Data_i)
    , .scb_stb_o (scb_stb_o)
    , .scb_ce_o  (scb_ce_o)
    , .scb_rd_o  (scb_rd_o)
    , .scb_wr_o  (scb_wr_o)
    , .scb_rdy_i (scb_rdy_i)
  
  , .dbus_ADBus_i(dbus_ADBus_i)
  , .dbus_ADBus_o(dbus_ADBus_o)
  , .dbus_ADBus_e(dbus_ADBus_e)
  , .dbus_ale_o  (dbus_ale_o)
  , .dbus_ale_e  (dbus_ale_e)
  , .dbus_dle_o  (dbus_dle_o)
  , .dbus_dle_e  (dbus_dle_e)
  , .dbus_stb_o  (dbus_stb_o)
  , .dbus_stb_e  (dbus_stb_e)
  , .dbus_rd_o   (dbus_rd_o)
  , .dbus_rd_e   (dbus_rd_e)
  , .dbus_wr_o   (dbus_wr_o)
  , .dbus_wr_e   (dbus_wr_e)
  , .dbus_rdy_i  (dbus_rdy_i)
  
  , .dbus_req_i  (dbus_req_i)
  , .dbus_ack_o  (dbus_ack_o)
  );
  
  //Block of fast memory
  SCB_memory scratchPad (
      .clk_i     (clk_i)
    , .rst_i     (rst_i)
  
    , .scb_Addr_i(scb_Addr_o)
    , .scb_Data_i(scb_Data_i)
    , .scb_Data_o(scb_Data_o)
    , .scb_stb_i (scb_stb_o)
    , .scb_ce_i  (scb_ce_o)
    , .scb_rd_i  (scb_rd_o)
    , .scb_wr_i  (scb_wr_o)
    , .scb_rdy_o (scb_rdy_i)
  );
  
endmodule
