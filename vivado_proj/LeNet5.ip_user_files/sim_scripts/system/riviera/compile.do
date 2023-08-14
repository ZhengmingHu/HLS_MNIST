vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_8
vlib riviera/processing_system7_vip_v1_0_10
vlib riviera/xil_defaultlib
vlib riviera/xbip_utils_v3_0_10
vlib riviera/axi_utils_v2_0_6
vlib riviera/xbip_pipe_v3_0_6
vlib riviera/xbip_dsp48_wrapper_v3_0_4
vlib riviera/xbip_dsp48_addsub_v3_0_6
vlib riviera/xbip_dsp48_multadd_v3_0_6
vlib riviera/xbip_bram18k_v3_0_6
vlib riviera/mult_gen_v12_0_16
vlib riviera/floating_point_v7_1_11
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/fifo_generator_v13_2_5
vlib riviera/axi_data_fifo_v2_1_21
vlib riviera/axi_register_slice_v2_1_22
vlib riviera/axi_protocol_converter_v2_1_22
vlib riviera/axi_clock_converter_v2_1_21
vlib riviera/blk_mem_gen_v8_4_4
vlib riviera/axi_dwidth_converter_v2_1_22

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 riviera/axi_vip_v1_1_8
vmap processing_system7_vip_v1_0_10 riviera/processing_system7_vip_v1_0_10
vmap xil_defaultlib riviera/xil_defaultlib
vmap xbip_utils_v3_0_10 riviera/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 riviera/axi_utils_v2_0_6
vmap xbip_pipe_v3_0_6 riviera/xbip_pipe_v3_0_6
vmap xbip_dsp48_wrapper_v3_0_4 riviera/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_6 riviera/xbip_dsp48_addsub_v3_0_6
vmap xbip_dsp48_multadd_v3_0_6 riviera/xbip_dsp48_multadd_v3_0_6
vmap xbip_bram18k_v3_0_6 riviera/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 riviera/mult_gen_v12_0_16
vmap floating_point_v7_1_11 riviera/floating_point_v7_1_11
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_5 riviera/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_21 riviera/axi_data_fifo_v2_1_21
vmap axi_register_slice_v2_1_22 riviera/axi_register_slice_v2_1_22
vmap axi_protocol_converter_v2_1_22 riviera/axi_protocol_converter_v2_1_22
vmap axi_clock_converter_v2_1_21 riviera/axi_clock_converter_v2_1_21
vmap blk_mem_gen_v8_4_4 riviera/blk_mem_gen_v8_4_4
vmap axi_dwidth_converter_v2_1_22 riviera/axi_dwidth_converter_v2_1_22

vlog -work xilinx_vip  -sv2k12 "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"E:/Downloadcache/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/Downloadcache/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"E:/Downloadcache/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8  -sv2k12 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_10  -sv2k12 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_processing_system7_0_0/sim/system_processing_system7_0_0.v" \

vcom -work xbip_utils_v3_0_10 -93 \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/d117/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6 -93 \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/1971/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/7468/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -93 \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/910d/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_6 -93 \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/b0ac/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93 \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/d367/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -93 \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/ce84/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_11 -93 \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/b0c0/hdl/floating_point_v7_1_rfs.vhd" \

vlog -work floating_point_v7_1_11  -v2k5 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/b0c0/hdl/floating_point_v7_1_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/verilog/lenet5_control_s_axi.v" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/verilog/lenet5_facc_32ns_32ns_1ns_32_5_no_dsp_1.v" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/verilog/lenet5_fadd_32ns_32ns_32_5_full_dsp_1.v" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/verilog/lenet5_fcmp_32ns_32ns_1_2_no_dsp_1.v" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/verilog/lenet5_feature_out_conv0.v" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/verilog/lenet5_feature_out_conv1.v" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/verilog/lenet5_feature_out_fc0.v" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/verilog/lenet5_feature_out_pool0.v" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/verilog/lenet5_feature_out_pool1.v" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/verilog/lenet5_fmul_32ns_32ns_32_4_max_dsp_1.v" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/verilog/lenet5_gmem_m_axi.v" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/verilog/lenet5.v" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/ip/FAcc.v" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/ip/lenet5_ap_fadd_3_full_dsp_32.v" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/ip/lenet5_ap_fcmp_0_no_dsp_32.v" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/73ef/hdl/ip/lenet5_ap_fmul_2_max_dsp_32.v" \
"../../../bd/system/ip/system_lenet5_0_0/sim/system_lenet5_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_rst_ps7_0_50M_0/sim/system_rst_ps7_0_50M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  -v2k5 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22  -v2k5 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_22  -v2k5 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_auto_pc_0/sim/system_auto_pc_0.v" \
"../../../bd/system/ip/system_auto_pc_1/sim/system_auto_pc_1.v" \

vlog -work axi_clock_converter_v2_1_21  -v2k5 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/1304/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_22  -v2k5 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../LeNet5.gen/sources_1/bd/system/ipshared/2394/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LeNet5.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+E:/Downloadcache/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_auto_us_0/sim/system_auto_us_0.v" \
"../../../bd/system/sim/system.v" \

vlog -work xil_defaultlib \
"glbl.v"

