// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XLENET5_H
#define XLENET5_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xlenet5_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XLenet5_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XLenet5;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XLenet5_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XLenet5_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XLenet5_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XLenet5_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XLenet5_Initialize(XLenet5 *InstancePtr, u16 DeviceId);
XLenet5_Config* XLenet5_LookupConfig(u16 DeviceId);
int XLenet5_CfgInitialize(XLenet5 *InstancePtr, XLenet5_Config *ConfigPtr);
#else
int XLenet5_Initialize(XLenet5 *InstancePtr, const char* InstanceName);
int XLenet5_Release(XLenet5 *InstancePtr);
#endif

void XLenet5_Start(XLenet5 *InstancePtr);
u32 XLenet5_IsDone(XLenet5 *InstancePtr);
u32 XLenet5_IsIdle(XLenet5 *InstancePtr);
u32 XLenet5_IsReady(XLenet5 *InstancePtr);
void XLenet5_EnableAutoRestart(XLenet5 *InstancePtr);
void XLenet5_DisableAutoRestart(XLenet5 *InstancePtr);

void XLenet5_Set_w_conv0(XLenet5 *InstancePtr, u64 Data);
u64 XLenet5_Get_w_conv0(XLenet5 *InstancePtr);
void XLenet5_Set_b_conv0(XLenet5 *InstancePtr, u64 Data);
u64 XLenet5_Get_b_conv0(XLenet5 *InstancePtr);
void XLenet5_Set_w_conv1(XLenet5 *InstancePtr, u64 Data);
u64 XLenet5_Get_w_conv1(XLenet5 *InstancePtr);
void XLenet5_Set_b_conv1(XLenet5 *InstancePtr, u64 Data);
u64 XLenet5_Get_b_conv1(XLenet5 *InstancePtr);
void XLenet5_Set_w_fc0(XLenet5 *InstancePtr, u64 Data);
u64 XLenet5_Get_w_fc0(XLenet5 *InstancePtr);
void XLenet5_Set_b_fc0(XLenet5 *InstancePtr, u64 Data);
u64 XLenet5_Get_b_fc0(XLenet5 *InstancePtr);
void XLenet5_Set_w_fc1(XLenet5 *InstancePtr, u64 Data);
u64 XLenet5_Get_w_fc1(XLenet5 *InstancePtr);
void XLenet5_Set_b_fc1(XLenet5 *InstancePtr, u64 Data);
u64 XLenet5_Get_b_fc1(XLenet5 *InstancePtr);
void XLenet5_Set_feature_in(XLenet5 *InstancePtr, u64 Data);
u64 XLenet5_Get_feature_in(XLenet5 *InstancePtr);
void XLenet5_Set_feature_out(XLenet5 *InstancePtr, u64 Data);
u64 XLenet5_Get_feature_out(XLenet5 *InstancePtr);
void XLenet5_Set_result(XLenet5 *InstancePtr, u64 Data);
u64 XLenet5_Get_result(XLenet5 *InstancePtr);

void XLenet5_InterruptGlobalEnable(XLenet5 *InstancePtr);
void XLenet5_InterruptGlobalDisable(XLenet5 *InstancePtr);
void XLenet5_InterruptEnable(XLenet5 *InstancePtr, u32 Mask);
void XLenet5_InterruptDisable(XLenet5 *InstancePtr, u32 Mask);
void XLenet5_InterruptClear(XLenet5 *InstancePtr, u32 Mask);
u32 XLenet5_InterruptGetEnabled(XLenet5 *InstancePtr);
u32 XLenet5_InterruptGetStatus(XLenet5 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
