// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xlenet5.h"

extern XLenet5_Config XLenet5_ConfigTable[];

XLenet5_Config *XLenet5_LookupConfig(u16 DeviceId) {
	XLenet5_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XLENET5_NUM_INSTANCES; Index++) {
		if (XLenet5_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XLenet5_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XLenet5_Initialize(XLenet5 *InstancePtr, u16 DeviceId) {
	XLenet5_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XLenet5_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XLenet5_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

