// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Mon May 30 12:31:58 2022
// Host        : DESKTOP-83K89T1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/HapraVersuche/v6/asha/asha.srcs/sources_1/ip/deviceinfo/deviceinfo_stub.v
// Design      : deviceinfo
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.1" *)
module deviceinfo(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[5:0],douta[82:0]" */;
  input clka;
  input [5:0]addra;
  output [82:0]douta;
endmodule
