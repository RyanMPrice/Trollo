module DIGOTA (INmb,
    INpb,
    cmnmos,
    cmpmos,
    oe,
    onmos,
    opmos,
    vdd,
    vss);
 input INmb;
 input INpb;
 output cmnmos;
 output cmpmos;
 input oe;
 output onmos;
 output opmos;
 input vdd;
 input vss;

 wire _0_;
 wire _1_;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;

 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2_ (.I(net2),
    .ZN(_1_),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _3_ (.A1(net3),
    .A2(_1_),
    .A3(net1),
    .ZN(net7),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _4_ (.I(net3),
    .ZN(_0_),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _5_ (.A1(_0_),
    .A2(_1_),
    .A3(net1),
    .ZN(net6),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _6_ (.A1(net3),
    .A2(net2),
    .A3(net1),
    .ZN(net5),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _7_ (.A1(_0_),
    .A2(net2),
    .A3(net1),
    .ZN(net4),
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
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_8 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_9 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_10 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__dlyc_1 input1 (.I(INmb),
    .Z(net1),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input2 (.I(INpb),
    .Z(net2),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input3 (.I(oe),
    .Z(net3),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output4 (.I(net4),
    .Z(cmnmos),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output5 (.I(net5),
    .Z(cmpmos),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output6 (.I(net6),
    .Z(onmos),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output7 (.I(net7),
    .Z(opmos),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input1_I (.I(INmb),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input2_I (.I(INpb),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input3_I (.I(oe),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_20 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_29 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_33 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_54 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_0_58 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_62 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_1_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_1_17 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_1_29 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_1_56 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_1_60 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_1_62 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_2_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_2_17 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_2_27 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_2_33 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_2_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_2_53 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_2_61 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_3_4 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_9 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_25 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_3_34 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_3_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_3_52 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_60 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_3_62 (.VDD(vdd),
    .VSS(vss));
endmodule
