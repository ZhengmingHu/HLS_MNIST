// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1ns/1ps

module lenet5_facc_32ns_32ns_1ns_32_5_no_dsp_1
#(parameter
  DWIDTH  = 32
)(
    input wire clk,
    input reset,
    input ce,
    input wire [DWIDTH-1:0] in_data,
    input in_valid,
    input in_last,
    output wire [DWIDTH-1:0] out_data
);

wire [DWIDTH-1:0] in_data_tmp = in_valid ? in_data : 0;
wire out_last;
wire out_valid;
wire reset_invert = ~reset;

//-------------------Instantiation----------------------------

FAcc FAcc_u (
    .aclk(clk),
    .aclken(ce),
    .aresetn(reset_invert),
    .s_axis_a_tvalid(in_valid),
    .s_axis_a_tdata(in_data_tmp),
    .s_axis_a_tlast(in_last),
    .m_axis_result_tvalid(out_valid),
    .m_axis_result_tdata(out_data),
    .m_axis_result_tlast(out_last)
);

//-------------------End Instantiation------------------------
endmodule
