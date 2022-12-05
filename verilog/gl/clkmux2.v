module clkmux2 (clka,
    clkb,
    gclk,
    select,
    vdd,
    vss);
 input clka;
 input clkb;
 output gclk;
 input select;
 input vdd;
 input vss;

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
    .ZN(_01_),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _03_ (.A1(_01_),
    .A2(clkpab),
    .ZN(clkbpb),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _04_ (.A1(clkpab),
    .A2(net1),
    .B1(net2),
    .B2(clkpbb),
    .ZN(_00_),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _05_ (.I(_00_),
    .ZN(net4),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _06_ (.A1(net3),
    .A2(clkpbb),
    .ZN(clkapa),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _07_ (.D(clkpba),
    .CLK(net2),
    .Q(clkpbb),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _08_ (.D(clkbpb),
    .CLK(net2),
    .Q(clkpba),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _09_ (.D(clkpaa),
    .CLK(net1),
    .Q(clkpab),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _10_ (.D(clkapa),
    .CLK(net1),
    .Q(clkpaa),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_0 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_1 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_3 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_4 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_5 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_6 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_7 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_8 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_9 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_10 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_11 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_12 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_13 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_14 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_15 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_16 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_17 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_18 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_19 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_20 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_21 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_22 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_23 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_24 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_25 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_26 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_27 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_28 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_29 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_30 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_31 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_32 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_33 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_34 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_35 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_36 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_38 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_39 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_40 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_41 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_42 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_43 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_44 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input1 (.I(clka),
    .Z(net1),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input2 (.I(clkb),
    .Z(net2),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input3 (.I(select),
    .Z(net3),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output4 (.I(net4),
    .Z(gclk),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input1_I (.I(clka),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input2_I (.I(clkb),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input3_I (.I(select),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_0_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_34 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_0_40 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_56 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_0_64 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_68 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_72 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_0_80 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_100 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_104 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_107 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_115 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_1_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_1_66 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_1_70 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_1_73 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_1_105 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_1_113 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_1_115 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_2_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_2_34 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_2_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_2_101 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_2_105 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_2_108 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_3_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_34 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_3_65 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_69 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_3_73 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_3_105 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_113 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_3_115 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_4_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_4_34 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_4_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_4_45 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_4_49 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_4_80 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_4_96 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_4_104 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_4_108 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_5_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_5_5 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_5_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_5_39 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_5_69 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_5_73 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_5_80 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_5_112 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_6_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_6_19 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_6_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_6_43 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_6_74 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_6_108 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_7_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_7_34 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_7_42 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_7_49 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_7_60 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_7_66 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_7_70 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_7_73 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_7_105 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_7_113 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_7_115 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_8_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_8_34 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_8_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_8_101 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_8_105 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_8_108 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_9_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_9_66 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_9_70 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_9_73 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_9_105 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_9_113 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_9_115 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_10_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_10_34 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_10_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_10_101 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_10_105 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_10_108 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_11_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_34 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_11_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_11_53 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_69 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_11_72 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_104 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_11_107 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_115 (.VDD(vdd),
    .VSS(vss));
endmodule
