############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project LeNet5_hls_proj
set_top lenet5
add_files src/LeNet5.cpp
add_files src/LeNet5.h
add_files src/conv.cpp
add_files src/linear.cpp
add_files src/pool.cpp
add_files src/softmax.cpp
add_files -tb src/main.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z100-ffg900-2}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog
source "./LeNet5_hls_proj/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
