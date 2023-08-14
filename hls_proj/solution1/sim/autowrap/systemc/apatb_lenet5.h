// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

extern "C" void AESL_WRAP_lenet5 (
volatile void* w_conv0,
volatile void* b_conv0,
volatile void* w_conv1,
volatile void* b_conv1,
volatile void* w_fc0,
volatile void* b_fc0,
volatile void* w_fc1,
volatile void* b_fc1,
volatile void* feature_in,
volatile void* feature_out,
volatile void* result);
