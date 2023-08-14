
set PATH=
call E:/Downloadcache/Xilinx/Vivado/2020.2/bin/xelab xil_defaultlib.apatb_lenet5_top glbl -prj lenet5.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims_ver -L xpm  -L floating_point_v7_0_18 -L floating_point_v7_1_11 --lib "ieee_proposed=./ieee_proposed" -s lenet5 
call E:/Downloadcache/Xilinx/Vivado/2020.2/bin/xsim --noieeewarnings lenet5 -tclbatch lenet5.tcl 

