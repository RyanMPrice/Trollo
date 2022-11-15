//Design for 1024x16 or 2kb of onboard memory scratchpad
module SCB_memory (
  input               clk_i
, input               rst_i

, input       [A-1:0] scb_Addr_i
, input       [D-1:0] scb_Data_i
, output wire [D-1:0] scb_Data_o
, input       [B-1:0] scb_stb_i
, input               scb_ce_i
, input               scb_rd_i
, input               scb_wr_i
, output wire         scb_rdy_o
);
  
  localparam A = 11;
  localparam D = 16;
  localparam B =  2;
  
  wire  highSelect = scb_ce_i &  scb_Addr_i[10];
  wire   lowSelect = scb_ce_i & ~scb_Addr_i[10];
  wire   oddSelect = scb_ce_i &  scb_stb_i[1];
  wire  evenSelect = scb_ce_i &  scb_stb_i[0];
  wire [ 8:0] addr =  scb_Addr_i[9:1];
  wire [ 7:0] dblo =  scb_Data_i[7:0];
  wire [ 7:0] dbhi =  scb_Data_i[15:8];
  
  wire [ 7:0] dbolo, dbohi, dbelo, dbehi;
  wire [15:0] dbol = {dbolo, dbelo};
  wire [15:0] dboh = {dbohi, dbehi};
  
  assign scb_rdy_o  = 1'b1;
  assign scb_Data_o = (highSelect) ? dboh :dbol;
  
  gf180mcu_fd_ip_sram__sram512x8m8wm1 oddMemLow  (
    .CLK (clk_i)
  , .CEN (~(oddSelect & lowSelect))
  , .GWEN(~scb_ce_i | scb_wr_i)
  , .WEN (8'h00)
  , .A   (addr)
  , .D   (dbhi)
  , .Q   (dbolo)
  );
  
  gf180mcu_fd_ip_sram__sram512x8m8wm1 oddMemHigh (
    .CLK (clk_i)
  , .CEN (~(oddSelect & highSelect))
  , .GWEN(~scb_ce_i | scb_wr_i)
  , .WEN (8'h00)
  , .A   (addr)
  , .D   (dbhi)
  , .Q   (dbohi)
  );
  
  gf180mcu_fd_ip_sram__sram512x8m8wm1 evenMemLow (
    .CLK (clk_i)
  , .CEN (~(evenSelect & lowSelect))
  , .GWEN(~scb_ce_i | scb_wr_i)
  , .WEN (8'h00)
  , .A   (addr)
  , .D   (dblo)
  , .Q   (dbelo)
  );
  
  gf180mcu_fd_ip_sram__sram512x8m8wm1 evenMemHigh(
    .CLK (clk_i)
  , .CEN (~(evenSelect & highSelect))
  , .GWEN(~scb_ce_i | scb_wr_i)
  , .WEN (8'h00)
  , .A   (addr)
  , .D   (dblo)
  , .Q   (dbehi)
  );
  
endmodule

