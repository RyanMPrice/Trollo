module clkgate (clk,
    gate,
    gclk,
    vdd,
    vss);
 input clk;
 input gate;
 output gclk;
 input vdd;
 input vss;

 wire _0_;
 wire _1_;
 wire clkp;
 wire net1;
 wire net2;
 wire net3;

 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2_ (.I(net1),
    .ZN(_1_),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3_ (.A1(net1),
    .A2(clkp),
    .Z(_0_),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 _4_ (.I(_0_),
    .Z(net3),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__latq_1 _5_ (.D(net2),
    .E(_1_),
    .Q(clkp),
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
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_14 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_15 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_16 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_17 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_18 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_19 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_20 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_21 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_22 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input1 (.I(clk),
    .Z(net1),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input2 (.I(gate),
    .Z(net2),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output3 (.I(net3),
    .Z(gclk),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input1_I (.I(clk),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__antenna ANTENNA_input2_I (.I(gate),
    .VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_0_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_34 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_40 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_58 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_0_66 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_72 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_80 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_1_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_1_66 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_1_70 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_1_73 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_2_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_2_18 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_2_26 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_2_32 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_2_34 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_2_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_2_69 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_2_77 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_3_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_3_5 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_3_13 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_17 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_39 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_3_49 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_3_65 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_3_69 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_3_73 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_4_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_4_19 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_4_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_4_44 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_4_76 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_4_80 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_5_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_5_66 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_5_70 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_5_73 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_6_2 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_6_34 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_6_37 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_6_41 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_6_56 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_6_64 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_6_68 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_6_72 (.VDD(vdd),
    .VSS(vss));
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_6_80 (.VDD(vdd),
    .VSS(vss));
endmodule
