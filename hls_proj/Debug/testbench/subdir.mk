################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
E:/HLSproj/src/main.cpp 

OBJS += \
./testbench/main.o 

CPP_DEPS += \
./testbench/main.d 


# Each subdirectory must supply rules for building sources it contributes
testbench/main.o: E:/HLSproj/src/main.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/win64/tools/systemc/include -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/include/ap_sysc -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/include -IE:/HLSproj -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/win64/tools/auto_cc/include -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/include/etc -O0 -g3 -Wall -Wno-unknown-pragmas -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"testbench/main.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


