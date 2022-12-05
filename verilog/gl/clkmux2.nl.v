// This is the unpowered netlist.
module clkmux2 (clka,
    clkb,
    gclk,
    select);
 input clka;
 input clkb;
 output gclk;
 input select;

 wire _00_;
 wire _01_;
 wire clkapa;
 wire clkbpb;
 wire clkpaa;
 wire clkpab;
 wire clkpba;
 wire clkpbb;
 wire net1;
 wire net2;
 wire net3;
 wire net4;

 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _02_ (.I(net3),
    .ZN(_01_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _03_ (.A1(_01_),
    .A2(clkpab),
    .ZN(clkbpb));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _04_ (.A1(clkpab),
    .A2(net1),
    .B1(net2),
    .B2(clkpbb),
    .ZN(_00_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _05_ (.I(_00_),
    .ZN(net4));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _06_ (.A1(net3),
    .A2(clkpbb),
    .ZN(clkapa));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _07_ (.D(clkpba),
    .CLK(net2),
    .Q(clkpbb));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _08_ (.D(clkbpb),
    .CLK(net2),
    .Q(clkpba));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _09_ (.D(clkpaa),
    .CLK(net1),
    .Q(clkpab));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _10_ (.D(clkapa),
    .CLK(net1),
    .Q(clkpaa));
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
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_14 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_15 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_16 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_17 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_18 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_19 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_20 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_21 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_22 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_23 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_24 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_25 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_26 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_27 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_28 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_29 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_30 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_31 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_32 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_33 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_34 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_35 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_36 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_37 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_38 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_39 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_40 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_41 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_42 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_43 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_44 ();
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input1 (.I(clka),
    .Z(net1));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input2 (.I(clkb),
    .Z(net2));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input3 (.I(select),
    .Z(net3));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output4 (.I(net4),
    .Z(gclk));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input1_I (.I(clka));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input2_I (.I(clkb));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input3_I (.I(select));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_0_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_0_40 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_56 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_0_64 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_68 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_72 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_0_80 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_100 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_104 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_107 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_115 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_1_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_1_66 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_1_70 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_1_73 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_1_105 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_1_113 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_1_115 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_2_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_2_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_2_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_2_101 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_2_105 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_2_108 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_3_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_3_65 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_69 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_3_73 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_3_105 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_113 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_3_115 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_4_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_4_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_4_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_4_45 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_4_49 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_4_80 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_4_96 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_4_104 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_4_108 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_5_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_5_5 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_5_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_5_39 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_5_69 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_5_73 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_5_80 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_5_112 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_6_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_6_19 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_6_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_6_43 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_6_74 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_6_108 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_7_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_7_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_7_42 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_7_49 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_7_60 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_7_66 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_7_70 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_7_73 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_7_105 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_7_113 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_7_115 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_8_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_8_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_8_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_8_101 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_8_105 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_8_108 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_9_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_9_66 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_9_70 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_9_73 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_9_105 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_9_113 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_9_115 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_10_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_10_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_10_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_10_101 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_10_105 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_10_108 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_11_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_11_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_11_53 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_69 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_11_72 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_104 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_11_107 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_115 ();
endmodule

