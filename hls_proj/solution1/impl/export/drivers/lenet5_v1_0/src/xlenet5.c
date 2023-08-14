// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xlenet5.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XLenet5_CfgInitialize(XLenet5 *InstancePtr, XLenet5_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XLenet5_Start(XLenet5 *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_AP_CTRL) & 0x80;
    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XLenet5_IsDone(XLenet5 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XLenet5_IsIdle(XLenet5 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XLenet5_IsReady(XLenet5 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XLenet5_EnableAutoRestart(XLenet5 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XLenet5_DisableAutoRestart(XLenet5 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_AP_CTRL, 0);
}

void XLenet5_Set_w_conv0(XLenet5 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_CONV0_DATA, (u32)(Data));
    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_CONV0_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet5_Get_w_conv0(XLenet5 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_CONV0_DATA);
    Data += (u64)XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_CONV0_DATA + 4) << 32;
    return Data;
}

void XLenet5_Set_b_conv0(XLenet5 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_CONV0_DATA, (u32)(Data));
    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_CONV0_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet5_Get_b_conv0(XLenet5 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_CONV0_DATA);
    Data += (u64)XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_CONV0_DATA + 4) << 32;
    return Data;
}

void XLenet5_Set_w_conv1(XLenet5 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_CONV1_DATA, (u32)(Data));
    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_CONV1_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet5_Get_w_conv1(XLenet5 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_CONV1_DATA);
    Data += (u64)XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_CONV1_DATA + 4) << 32;
    return Data;
}

void XLenet5_Set_b_conv1(XLenet5 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_CONV1_DATA, (u32)(Data));
    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_CONV1_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet5_Get_b_conv1(XLenet5 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_CONV1_DATA);
    Data += (u64)XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_CONV1_DATA + 4) << 32;
    return Data;
}

void XLenet5_Set_w_fc0(XLenet5 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_FC0_DATA, (u32)(Data));
    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_FC0_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet5_Get_w_fc0(XLenet5 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_FC0_DATA);
    Data += (u64)XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_FC0_DATA + 4) << 32;
    return Data;
}

void XLenet5_Set_b_fc0(XLenet5 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_FC0_DATA, (u32)(Data));
    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_FC0_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet5_Get_b_fc0(XLenet5 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_FC0_DATA);
    Data += (u64)XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_FC0_DATA + 4) << 32;
    return Data;
}

void XLenet5_Set_w_fc1(XLenet5 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_FC1_DATA, (u32)(Data));
    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_FC1_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet5_Get_w_fc1(XLenet5 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_FC1_DATA);
    Data += (u64)XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_W_FC1_DATA + 4) << 32;
    return Data;
}

void XLenet5_Set_b_fc1(XLenet5 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_FC1_DATA, (u32)(Data));
    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_FC1_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet5_Get_b_fc1(XLenet5 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_FC1_DATA);
    Data += (u64)XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_B_FC1_DATA + 4) << 32;
    return Data;
}

void XLenet5_Set_feature_in(XLenet5 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_FEATURE_IN_DATA, (u32)(Data));
    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_FEATURE_IN_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet5_Get_feature_in(XLenet5 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_FEATURE_IN_DATA);
    Data += (u64)XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_FEATURE_IN_DATA + 4) << 32;
    return Data;
}

void XLenet5_Set_feature_out(XLenet5 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_FEATURE_OUT_DATA, (u32)(Data));
    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_FEATURE_OUT_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet5_Get_feature_out(XLenet5 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_FEATURE_OUT_DATA);
    Data += (u64)XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_FEATURE_OUT_DATA + 4) << 32;
    return Data;
}

void XLenet5_Set_result(XLenet5 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_RESULT_DATA, (u32)(Data));
    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_RESULT_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet5_Get_result(XLenet5 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_RESULT_DATA);
    Data += (u64)XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_RESULT_DATA + 4) << 32;
    return Data;
}

void XLenet5_InterruptGlobalEnable(XLenet5 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_GIE, 1);
}

void XLenet5_InterruptGlobalDisable(XLenet5 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_GIE, 0);
}

void XLenet5_InterruptEnable(XLenet5 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_IER);
    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_IER, Register | Mask);
}

void XLenet5_InterruptDisable(XLenet5 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_IER);
    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_IER, Register & (~Mask));
}

void XLenet5_InterruptClear(XLenet5 *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet5_WriteReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_ISR, Mask);
}

u32 XLenet5_InterruptGetEnabled(XLenet5 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_IER);
}

u32 XLenet5_InterruptGetStatus(XLenet5 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XLenet5_ReadReg(InstancePtr->Control_BaseAddress, XLENET5_CONTROL_ADDR_ISR);
}

