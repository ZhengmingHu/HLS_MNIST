create_project prj -part xc7z100-ffg900-2 -force
set_property target_language verilog [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/verilog"
source "E:/HLSproj/LeNet5_hls_proj/solution1/syn/verilog/FAcc_ip.tcl"
source "E:/HLSproj/LeNet5_hls_proj/solution1/syn/verilog/lenet5_ap_fadd_3_full_dsp_32_ip.tcl"
source "E:/HLSproj/LeNet5_hls_proj/solution1/syn/verilog/lenet5_ap_fcmp_0_no_dsp_32_ip.tcl"
source "E:/HLSproj/LeNet5_hls_proj/solution1/syn/verilog/lenet5_ap_fmul_2_max_dsp_32_ip.tcl"
