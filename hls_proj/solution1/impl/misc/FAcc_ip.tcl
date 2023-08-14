create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name FAcc
set_property -dict [list CONFIG.Add_Sub_Value {Add} CONFIG.Has_ACLKEN {true} CONFIG.Has_ARESETn {true} CONFIG.Operation_Type {Accumulator} \
                         CONFIG.C_Optimization {Low_Latency} \
                         CONFIG.Flow_Control {NonBlocking} \
                         CONFIG.Maximum_Latency {false} \
                         CONFIG.A_Precision_Type {Single} \
                         CONFIG.C_A_Exponent_Width {8} \
                         CONFIG.C_A_Fraction_Width {24} \
                         CONFIG.Result_Precision_Type {Single} \
                         CONFIG.C_Result_Exponent_Width {8} \
                         CONFIG.C_Result_Fraction_Width {24} \
                         CONFIG.C_Mult_Usage {No_Usage} \
                         CONFIG.Has_RESULT_TREADY {false} \
                         CONFIG.C_Latency {4} \
                         CONFIG.C_Rate {1} \
                         CONFIG.Has_A_TLAST {true} \
                         CONFIG.RESULT_TLAST_Behv {Pass_A_TLAST}] [get_ips FAcc] -quiet
generate_target {simulation synthesis} [get_files FAcc.xci]
