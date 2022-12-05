// This is the unpowered netlist.
module DiffDigota (INmb,
    INpb,
    OUTm,
    OUTp,
    cmnmos,
    cmpmos,
    oe,
    omnmos,
    ompmos,
    opnmos,
    oppmos);
 input INmb;
 input INpb;
 input OUTm;
 input OUTp;
 output cmnmos;
 output cmpmos;
 input oe;
 output omnmos;
 output ompmos;
 output opnmos;
 output oppmos;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;

 gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 _07_ (.I(net1),
    .Z(_00_));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 _08_ (.I(net2),
    .Z(_01_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _09_ (.A1(net5),
    .A2(_00_),
    .A3(_01_),
    .ZN(net7));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _10_ (.I(net5),
    .ZN(_02_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _11_ (.A1(_02_),
    .A2(_00_),
    .A3(_01_),
    .ZN(net6));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _12_ (.A1(net4),
    .A2(net3),
    .B(net1),
    .ZN(_03_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _13_ (.A1(_01_),
    .A2(_03_),
    .B(_02_),
    .ZN(net9));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _14_ (.A1(net4),
    .A2(net3),
    .B(net1),
    .ZN(_04_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _15_ (.A1(_02_),
    .A2(_01_),
    .A3(_04_),
    .ZN(net8));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _16_ (.A1(net4),
    .A2(net3),
    .B(net2),
    .ZN(_05_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _17_ (.A1(net5),
    .A2(_00_),
    .A3(_05_),
    .ZN(net11));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _18_ (.A1(net4),
    .A2(net3),
    .B(net2),
    .ZN(_06_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _19_ (.A1(_00_),
    .A2(_06_),
    .B(net5),
    .ZN(net10));
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
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input1 (.I(INmb),
    .Z(net1));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input2 (.I(INpb),
    .Z(net2));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 input3 (.I(OUTm),
    .Z(net3));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 input4 (.I(OUTp),
    .Z(net4));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 input5 (.I(oe),
    .Z(net5));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output6 (.I(net6),
    .Z(cmnmos));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output7 (.I(net7),
    .Z(cmpmos));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output8 (.I(net8),
    .Z(omnmos));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output9 (.I(net9),
    .Z(ompmos));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output10 (.I(net10),
    .Z(opnmos));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output11 (.I(net11),
    .Z(oppmos));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input1_I (.I(INmb));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input2_I (.I(INpb));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input3_I (.I(OUTm));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input4_I (.I(OUTp));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input5_I (.I(oe));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA__19__B (.I(net5));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA__17__A1 (.I(net5));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA__10__I (.I(net5));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA__09__A1 (.I(net5));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_0_20 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_26 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_54 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_58 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_0_66 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_72 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_0_80 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_90 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_98 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_102 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_104 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_107 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_115 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_1_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_1_17 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_1_21 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_1_29 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_1_39 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_1_49 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_1_59 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_1_67 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_1_73 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_1_89 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_1_92 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_1_108 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_2_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_2_5 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_2_21 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_2_32 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_2_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_2_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_2_49 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_2_81 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_2_97 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_2_105 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_2_108 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_3_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_36 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_3_40 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_3_48 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_52 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_3_54 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_59 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_3_63 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_3_73 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_3_105 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_113 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_3_115 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_4_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_4_18 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_4_26 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_4_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_4_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_4_47 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_4_51 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_4_83 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_4_99 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_4_103 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_4_105 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_4_108 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_5_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_5_18 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_5_26 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_5_36 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_5_44 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_5_46 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_5_55 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_5_65 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_5_69 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_5_73 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_5_105 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_5_113 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_5_115 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_6_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_6_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_6_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_6_101 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_6_105 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_6_108 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_7_2 ();
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
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_10_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_10_17 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_10_33 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_10_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_10_69 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_10_77 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_10_81 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_10_83 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_10_98 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_10_108 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_11_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_6 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_11_21 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_11_29 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_11_33 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_11_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_41 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_11_56 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_11_64 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_11_68 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_11_72 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_76 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_11_91 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_11_99 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_11_103 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_11_107 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_115 ();
endmodule

