################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
E:/HLSproj/src/LeNet5.cpp \
E:/HLSproj/src/conv.cpp \
E:/HLSproj/src/pool.cpp 

OBJS += \
./source/LeNet5.o \
./source/conv.o \
./source/pool.o 

CPP_DEPS += \
./source/LeNet5.d \
./source/conv.d \
./source/pool.d 


# Each subdirectory must supply rules for building sources it contributes
source/LeNet5.o: E:/HLSproj/src/LeNet5.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/win64/tools/systemc/include -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/include/ap_sysc -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/include -IE:/HLSproj -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/win64/tools/auto_cc/include -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/include/etc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

source/conv.o: E:/HLSproj/src/conv.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/win64/tools/systemc/include -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/include/ap_sysc -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/include -IE:/HLSproj -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/win64/tools/auto_cc/include -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/include/etc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

source/pool.o: E:/HLSproj/src/pool.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/win64/tools/systemc/include -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/include/ap_sysc -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/include -IE:/HLSproj -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/win64/tools/auto_cc/include -IE:/Downloadcache/Xilinx/Vitis_HLS/2020.2/include/etc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


