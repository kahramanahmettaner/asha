// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Mon May 30 12:31:32 2022
// Host        : DESKTOP-83K89T1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/HapraVersuche/v6/asha/asha.srcs/sources_1/ip/clk_wiz/clk_wiz_stub.v
// Design      : clk_wiz
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz(clk_out, clk_in)
/* synthesis syn_black_box black_box_pad_pin="clk_out,clk_in" */;
  output clk_out;
  input clk_in;
endmodule
