
module WavePWM #(
  parameter Sbits = 4  // Bits of complex signal pattern
, parameter Sover = 3  // Carrier cycles (2**THIS)
, parameter Wbits = 8  // Bits of carrier resolution
, parameter Wover = 1  // Oversampling of waveform (2**THIS)
, parameter Dbits = 16 // Phase resolution
, parameter Dover = 1
) ( 
  input               clk
, input               rst

, input               enable
, input       [O-1:0] divSel

, output wire         qcos
, output wire         qsin
, output wire         qcomplex
);
  
  localparam S = Sbits;
  localparam R = Sover;
  localparam Q = Wbits;
  localparam P = Wover;
  localparam D = Dbits;
  localparam F = Dover;
  localparam N = D+F+P+Q+R+S;
  localparam M = Dbits * 2;
  localparam L = Dbits;
  localparam O = $clog2(Dbits);
  
  reg    [N-1:0] freeRunCntr;
  //wire [F-1:0] minDuty = freeRunCntr[  F      -1:0      ];
    wire [D-1:0] freeRun = freeRunCntr[D+F      -1:F      ];
  //wire [P-1:0] overRun = freeRunCntr[D+F+P    -1:D      ];
    wire [Q-1:0] wavPtr  = freeRunCntr[D+F+P+Q  -1:D+F+P  ];
  //wire [R-1:0] waveRun = freeRunCntr[D+F+P+Q+R-1:D+F+P+Q];
    wire [S-1:0] sigPtr  = freeRunCntr[        N-1:N-S    ];
  reg    [Q-1:0] wavPtr0;
  
  wire [D-1:0] sigA, sigB, cos, sin;
  wire [M-1:0] immA, immB;
  wire [M-1:0] cadd     = (immA + immB);
  wire [D-1:0] complex  = cadd[L+D-1:L];
  wire         samp     = ~(wavPtr0 == wavPtr);
  assign       qcos     = (freeRun < cos);
  assign       qsin     = (freeRun < sin);
  assign       qcomplex = (freeRun < complex);
  
  always @ (posedge clk or negedge rst)
    if( rst == 1'b0 )
      freeRunCntr = 0;
    else
      freeRunCntr = freeRunCntr + (1 << divSel);
  
  always @ (posedge clk or negedge rst)
    if( rst == 1'b0 )
      wavPtr0 = 0;
    else
      wavPtr0 = wavPtr;
  
  WaveTblCosSin #(Q, D) csTable (
      .address(wavPtr) 
    , .cos    (cos)
    , .sin    (sin)
  );
  
  WaveTblSig #(S, D) sigRom ( 
      .address(sigPtr)
    , .sigA   (sigA)
    , .sigB   (sigB)
  );
  
  BinMultiplier #(D) binMultA (
      .clk   (clk)
    , .rst   (rst)
    , .enable(samp)
    , .dba   (cos)
    , .dbb   (sigA)
    , .Y     (immA)
  );
  
  BinMultiplier #(D) binMultB (
      .clk   (clk)
    , .rst   (rst)
    , .enable(samp)
    , .dba   (sin)
    , .dbb   (sigB)
    , .Y     (immB)
  );
  
endmodule
