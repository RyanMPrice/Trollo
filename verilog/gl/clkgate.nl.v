// This is the unpowered netlist.
module clkgate (clk,
    gate,
    gclk);
 input clk;
 input gate;
 output gclk;

 wire _0_;
 wire _1_;
 wire clkp;
 wire net1;
 wire net2;
 wire net3;

 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2_ (.I(net1),
    .ZN(_1_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3_ (.A1(net1),
    .A2(clkp),
    .Z(_0_));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 _4_ (.I(_0_),
    .Z(net3));
 gf180mcu_fd_sc_mcu7t5v0__latq_1 _5_ (.D(net2),
    .E(_1_),
    .Q(clkp));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_0 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_1 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_2 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_3 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_4 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_5 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_6 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_7 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_8 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_9 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_10 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_11 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_12 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_13 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_14 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_15 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_16 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_17 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_18 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_19 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_20 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_21 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_22 ();
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input1 (.I(clk),
    .Z(net1));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input2 (.I(gate),
    .Z(net2));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output3 (.I(net3),
    .Z(gclk));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input1_I (.I(clk));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input2_I (.I(gate));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_0_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_40 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_58 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_0_66 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_72 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_80 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_1_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_1_66 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_1_70 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_1_73 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_2_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_2_18 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_2_26 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_2_32 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_2_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_2_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_2_69 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_2_77 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_3_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_3_5 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_3_13 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_17 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_39 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_3_49 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_3_65 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_69 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_3_73 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_4_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_4_19 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_4_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_4_44 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_4_76 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_4_80 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_5_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_5_66 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_5_70 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_5_73 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_6_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_6_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_6_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_6_41 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_6_56 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_6_64 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_6_68 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_6_72 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_6_80 ();
endmodule

