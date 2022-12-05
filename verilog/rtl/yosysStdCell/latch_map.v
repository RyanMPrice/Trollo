module \$_DLATCH_P_ (input E, input D, output Q);
  gf180mcu_fd_sc_mcu7t5v0__latq_1 _TECHMAP_REPLACE_ (
    //# {{data|Data Signals}}
    .D (D),
    .Q (Q),
    
    //# {{clocks|Clocking}}
    .E (E)
  );
endmodule

module \$_DLATCH_N_ (input E, input D, output Q);
  gf180mcu_fd_sc_mcu7t5v0__latq_1 _TECHMAP_REPLACE_ (
    //# {{data|Data Signals}}
    .D (D),
    .Q (Q),
    
    //# {{clocks|Clocking}}
    .E (~E)
  );
endmodule
