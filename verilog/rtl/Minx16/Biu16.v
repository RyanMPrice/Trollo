
module Biu1616 (
  input               clk
, input               rst

, input       [A-1:0] core_Addr_i
, input       [D-1:0] core_Data_i
, output reg  [D-1:0] core_Data_o
, input               core_rd16
, input               core_rd8
, input       [  1:0] core_wr
, output reg          core_rdy
, output reg          core_done

, output reg  [A-1:0] bus_Addr_o
, output reg  [A-1:0] bus_Addr_e
, input       [D-1:0] bus_Data_i
, output reg  [D-1:0] bus_Data_o
, output reg  [D-1:0] bus_Data_e
, output reg  [B-1:0] bus_stb_o
, output reg  [B-1:0] bus_stb_e
, output reg          bus_rd_o
, output reg          bus_rd_e
, output reg          bus_wr_o
, output reg          bus_wr_e
, input               bus_rdy_i

, input               bus_req_i
, output reg          bus_ack_o
);
  
  localparam A = 16;
  localparam ADRENABLE   = {A{1'b1}};
  localparam ADRDISABLE  = {A{1'b0}};

  localparam D = 16;
  localparam B = D / 8;
  localparam BUSENABLE   = {D{1'b0}};
  localparam BUSDISABLE  = {D{1'b1}};
  localparam STBENABLE   = {B{1'b0}};
  localparam STBDISABLE  = {B{1'b1}};
  localparam STBACTIVE   = 1'b1;
  localparam STBINACTIVE = 1'b0;
  
  localparam RDACTIVE    = 1'b0;
  localparam RDINACTIVE  = 1'b1;
  localparam RDENABLE    = 1'b0;
  localparam RDDISABLE   = 1'b1;

  localparam WRACTIVE    = 1'b0;
  localparam WRINACTIVE  = 1'b1;
  localparam WRENABLE    = 1'b0;
  localparam WRDISABLE   = 1'b1;
  
  localparam STATE_RESET = 3'b000; // 
  localparam STATE_IDLE  = 3'b001; // 
  localparam STATE_16A   = 3'b010; // 
  localparam STATE_16B   = 3'b011; // 
  localparam STATE_16C   = 3'b100; // 
  localparam STATE_16D   = 3'b101; // 
  localparam STATE_BUSR  = 3'b110; // Bus access was requested given
  
  wire core_wr16 =  core_wr[0] & core_wr[1];
  wire core_wr8  =  core_wr[0] ^ core_wr[1];
  
  wire core_wrs  = (core_wr[0] | core_wr[1]);
  wire core_rds  = (core_rd16  | core_rd8  );
  wire core16    = (core_rd16  | core_wr16 );
  wire core8     = (core_rd8   | core_wr8  );
  wire unaligned = core_Addr_i[0] & core16;
   
  reg [A-1:0] tAddr;
  
  reg [2:0] pstate, nstate;
  
  always @ (posedge clk or negedge rst)
    if( rst == 1'b0 )
      pstate = STATE_RESET;
    else
      pstate = nstate;
  
  always @*
    begin
      bus_Data_o = bus_Data_o;
      bus_Data_e = bus_Data_e;
      bus_Addr_o = bus_Addr_o;
      bus_Addr_e = ADRENABLE;
      bus_ack_o  = 1'b0;
      bus_rd_o   = RDINACTIVE;
      bus_rd_e   = RDENABLE;
      bus_wr_o   = WRINACTIVE;
      bus_wr_e   = WRENABLE;
      core_rdy   = 1'b0;
      core_done  = 1'b0;
      case(pstate)
        STATE_RESET : begin
                        tAddr       = 16'h0000;
                        bus_Addr_o  = 16'h0000;
                        bus_Data_o  = 16'h0000;
                        bus_Data_e  = BUSDISABLE;
                        core_Data_o = 16'h0000;
                        bus_stb_o   = {B{STBINACTIVE}};
                        bus_stb_e   = STBENABLE;
                        nstate      = STATE_IDLE;
                      end
        STATE_IDLE  : begin
                        tAddr       = 16'h0000;
                        bus_Addr_o  = 16'h0000;
                        bus_Data_o  = 16'h0000;
                        bus_Data_e  = BUSDISABLE;
                        core_Data_o = 16'h0000;
                        core_rdy    = 1'b1;
                        bus_stb_o   = {B{STBINACTIVE}};
                        bus_stb_e   = STBENABLE;
                        if( bus_req_i == 1'b1 )
                          nstate = STATE_BUSR;
                        else if( core16 | core8 )
                          begin
                            if( core_wr16 == 1'b1 & core_wr8 == 1'b0 & core_Addr_i[0] == 1'b0 )
                              begin
                                tAddr      = {core_Addr_i[A-1:1], 1'b0};
                                bus_Data_o = (core_wrs) ? core_Data_i : 16'h0000;
                                bus_Data_e = BUSENABLE;
                                nstate     = STATE_16A;
                              end
                            else if( core_wr16 == 1'b1 & core_wr8 == 1'b0 & core_Addr_i[0] == 1'b1) 
                              begin
                                tAddr      = core_Addr_i;
                                bus_Data_o = (core_wrs) ? {core_Data_i[7:0], core_Data_i[7:0]} : 16'h0000;
                                bus_Data_e = BUSENABLE;
                                nstate     = STATE_16A;
                              end
                            else if( core_wr16 == 1'b0 & core_wr[1] == 1'b0 & core_wr[0] == 1'b1 )
                              begin
                                tAddr      = core_Addr_i;
                                bus_Data_o = (core_wrs) ? {core_Data_i[7:0], core_Data_i[7:0]} : 16'h0000;
                                bus_Data_e = BUSENABLE;
                                nstate     = STATE_16A;
                              end
                            else if( core_wr16 == 1'b0 & core_wr[1] == 1'b1 & core_wr[0] == 1'b0 )
                              begin
                                tAddr      = core_Addr_i;
                                bus_Data_o = (core_wrs) ? {core_Data_i[15:8], core_Data_i[15:8]} : 16'h0000;
                                bus_Data_e = BUSENABLE;
                                nstate     = STATE_16A;
                              end
                            else
                              begin
                                tAddr      = core_Addr_i;
                                bus_Data_o = 0;
                                bus_Data_e = BUSENABLE;
                                nstate     = STATE_16A;
                              end
                          end
                        else
                          nstate = STATE_IDLE;
                      end
        STATE_16A   : begin
                        if( core16 & core_Addr_i[0] == 1'b0)
                          bus_stb_o = {B{STBACTIVE}};
                        else
                          bus_stb_o = { ( tAddr[0]) ? STBACTIVE : STBINACTIVE,
                                        (~tAddr[0]) ? STBACTIVE : STBINACTIVE};
                        bus_stb_e   = STBENABLE;
                        bus_Addr_o  = tAddr;
                        bus_rd_o    = (core_rds) ? RDACTIVE : RDINACTIVE;
                        bus_wr_o    = (core_wrs) ? WRACTIVE : WRINACTIVE;
                        nstate      = STATE_16B;
                      end
        STATE_16B   : begin
                        if( core_rd16 == 1'b1 & core_Addr_i[0] == 1'b0 )
                          core_Data_o = bus_Data_i;
                        else if( bus_stb_o[1] )
                          core_Data_o = bus_Data_i[15:8];
                        else
                          core_Data_o = bus_Data_i[7:0];
                        bus_stb_o   = bus_stb_o;
                        bus_stb_e   = STBENABLE;
                        bus_rd_o    = (core_rds) ? RDACTIVE : RDINACTIVE;
                        bus_wr_o    = (core_wrs) ? WRACTIVE : WRINACTIVE;
                        if( bus_rdy_i == 1'b1 & unaligned == 1'b1 )
                          begin
                            tAddr     = tAddr + 1;
                            nstate    = STATE_16C;
                            core_done = 1'b0;
                          end
                        else if( bus_rdy_i == 1'b1 & unaligned == 1'b0 )
                          begin
                            nstate    = STATE_IDLE;
                            core_done = 1'b1;
                          end
                        else
                          begin
                            nstate    = STATE_16B;
                            core_done = 1'b0;
                          end
                      end
        STATE_16C   : begin
                        if( core_wrs )
                          begin
                            bus_Data_o = {8'h00, core_Data_i[15:8]};
                            bus_Data_e = BUSENABLE;
                          end
                        else
                          begin
                            bus_Data_o = 0;
                            bus_Data_e = BUSDISABLE;
                          end
                        bus_Addr_o   = tAddr;
                        bus_stb_o    = {STBINACTIVE, STBACTIVE};
                        bus_stb_e    = STBENABLE;
                        bus_rd_o     = (core_rds) ? RDACTIVE : RDINACTIVE;
                        bus_wr_o     = (core_wrs) ? WRACTIVE : WRINACTIVE;
                        nstate       = STATE_16D;
                      end
        STATE_16D   : begin
                        core_Data_o[15:8] = bus_Data_i[7:0];
                        bus_stb_o         = bus_stb_o;
                        bus_stb_e         = STBENABLE;
                        bus_rd_o          = (core_rds) ? RDACTIVE : RDINACTIVE;
                        bus_wr_o          = (core_wrs) ? WRACTIVE : WRINACTIVE;
                        core_done         = bus_rdy_i;
                        if( bus_rdy_i == 1'b1 )
                          nstate          = STATE_IDLE;
                        else
                          nstate          = STATE_16D;
                      end
        STATE_BUSR  : begin
                        bus_Addr_e = ADRDISABLE;
                        bus_Data_e = BUSDISABLE;
                        bus_stb_o  = STBINACTIVE;
                        bus_stb_o  = STBDISABLE;
                        bus_rd_o   = RDINACTIVE;
                        bus_rd_e   = RDDISABLE;
                        bus_wr_o   = WRINACTIVE;
                        bus_wr_e   = WRDISABLE;
                        bus_ack_o  = 1'b1;
                        if( bus_req_i == 1'b1 )
                          nstate = STATE_BUSR;
                        else
                          nstate = STATE_IDLE;
                      end
        default     : begin
                        nstate = STATE_RESET;
                      end
      endcase
    end
  
endmodule
