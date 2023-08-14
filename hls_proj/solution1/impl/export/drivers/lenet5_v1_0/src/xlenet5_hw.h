// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - enable ap_done interrupt (Read/Write)
//        bit 1  - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - ap_done (COR/TOW)
//        bit 1  - ap_ready (COR/TOW)
//        others - reserved
// 0x10 : Data signal of w_conv0
//        bit 31~0 - w_conv0[31:0] (Read/Write)
// 0x14 : Data signal of w_conv0
//        bit 31~0 - w_conv0[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of b_conv0
//        bit 31~0 - b_conv0[31:0] (Read/Write)
// 0x20 : Data signal of b_conv0
//        bit 31~0 - b_conv0[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of w_conv1
//        bit 31~0 - w_conv1[31:0] (Read/Write)
// 0x2c : Data signal of w_conv1
//        bit 31~0 - w_conv1[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of b_conv1
//        bit 31~0 - b_conv1[31:0] (Read/Write)
// 0x38 : Data signal of b_conv1
//        bit 31~0 - b_conv1[63:32] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of w_fc0
//        bit 31~0 - w_fc0[31:0] (Read/Write)
// 0x44 : Data signal of w_fc0
//        bit 31~0 - w_fc0[63:32] (Read/Write)
// 0x48 : reserved
// 0x4c : Data signal of b_fc0
//        bit 31~0 - b_fc0[31:0] (Read/Write)
// 0x50 : Data signal of b_fc0
//        bit 31~0 - b_fc0[63:32] (Read/Write)
// 0x54 : reserved
// 0x58 : Data signal of w_fc1
//        bit 31~0 - w_fc1[31:0] (Read/Write)
// 0x5c : Data signal of w_fc1
//        bit 31~0 - w_fc1[63:32] (Read/Write)
// 0x60 : reserved
// 0x64 : Data signal of b_fc1
//        bit 31~0 - b_fc1[31:0] (Read/Write)
// 0x68 : Data signal of b_fc1
//        bit 31~0 - b_fc1[63:32] (Read/Write)
// 0x6c : reserved
// 0x70 : Data signal of feature_in
//        bit 31~0 - feature_in[31:0] (Read/Write)
// 0x74 : Data signal of feature_in
//        bit 31~0 - feature_in[63:32] (Read/Write)
// 0x78 : reserved
// 0x7c : Data signal of feature_out
//        bit 31~0 - feature_out[31:0] (Read/Write)
// 0x80 : Data signal of feature_out
//        bit 31~0 - feature_out[63:32] (Read/Write)
// 0x84 : reserved
// 0x88 : Data signal of result
//        bit 31~0 - result[31:0] (Read/Write)
// 0x8c : Data signal of result
//        bit 31~0 - result[63:32] (Read/Write)
// 0x90 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XLENET5_CONTROL_ADDR_AP_CTRL          0x00
#define XLENET5_CONTROL_ADDR_GIE              0x04
#define XLENET5_CONTROL_ADDR_IER              0x08
#define XLENET5_CONTROL_ADDR_ISR              0x0c
#define XLENET5_CONTROL_ADDR_W_CONV0_DATA     0x10
#define XLENET5_CONTROL_BITS_W_CONV0_DATA     64
#define XLENET5_CONTROL_ADDR_B_CONV0_DATA     0x1c
#define XLENET5_CONTROL_BITS_B_CONV0_DATA     64
#define XLENET5_CONTROL_ADDR_W_CONV1_DATA     0x28
#define XLENET5_CONTROL_BITS_W_CONV1_DATA     64
#define XLENET5_CONTROL_ADDR_B_CONV1_DATA     0x34
#define XLENET5_CONTROL_BITS_B_CONV1_DATA     64
#define XLENET5_CONTROL_ADDR_W_FC0_DATA       0x40
#define XLENET5_CONTROL_BITS_W_FC0_DATA       64
#define XLENET5_CONTROL_ADDR_B_FC0_DATA       0x4c
#define XLENET5_CONTROL_BITS_B_FC0_DATA       64
#define XLENET5_CONTROL_ADDR_W_FC1_DATA       0x58
#define XLENET5_CONTROL_BITS_W_FC1_DATA       64
#define XLENET5_CONTROL_ADDR_B_FC1_DATA       0x64
#define XLENET5_CONTROL_BITS_B_FC1_DATA       64
#define XLENET5_CONTROL_ADDR_FEATURE_IN_DATA  0x70
#define XLENET5_CONTROL_BITS_FEATURE_IN_DATA  64
#define XLENET5_CONTROL_ADDR_FEATURE_OUT_DATA 0x7c
#define XLENET5_CONTROL_BITS_FEATURE_OUT_DATA 64
#define XLENET5_CONTROL_ADDR_RESULT_DATA      0x88
#define XLENET5_CONTROL_BITS_RESULT_DATA      64

