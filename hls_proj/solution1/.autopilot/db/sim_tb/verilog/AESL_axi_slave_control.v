// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps

module AESL_axi_slave_control (
    clk,
    reset,
    TRAN_s_axi_control_AWADDR,
    TRAN_s_axi_control_AWVALID,
    TRAN_s_axi_control_AWREADY,
    TRAN_s_axi_control_WVALID,
    TRAN_s_axi_control_WREADY,
    TRAN_s_axi_control_WDATA,
    TRAN_s_axi_control_WSTRB,
    TRAN_s_axi_control_ARADDR,
    TRAN_s_axi_control_ARVALID,
    TRAN_s_axi_control_ARREADY,
    TRAN_s_axi_control_RVALID,
    TRAN_s_axi_control_RREADY,
    TRAN_s_axi_control_RDATA,
    TRAN_s_axi_control_RRESP,
    TRAN_s_axi_control_BVALID,
    TRAN_s_axi_control_BREADY,
    TRAN_s_axi_control_BRESP,
    TRAN_control_write_data_finish,
    TRAN_control_start_in,
    TRAN_control_idle_out,
    TRAN_control_ready_out,
    TRAN_control_ready_in,
    TRAN_control_done_out,
    TRAN_control_write_start_in   ,
    TRAN_control_write_start_finish,
    TRAN_control_interrupt,
    TRAN_control_transaction_done_in
    );

//------------------------Parameter----------------------
`define TV_IN_w_conv0 "./c.lenet5.autotvin_w_conv0.dat"
`define TV_IN_b_conv0 "./c.lenet5.autotvin_b_conv0.dat"
`define TV_IN_w_conv1 "./c.lenet5.autotvin_w_conv1.dat"
`define TV_IN_b_conv1 "./c.lenet5.autotvin_b_conv1.dat"
`define TV_IN_w_fc0 "./c.lenet5.autotvin_w_fc0.dat"
`define TV_IN_b_fc0 "./c.lenet5.autotvin_b_fc0.dat"
`define TV_IN_w_fc1 "./c.lenet5.autotvin_w_fc1.dat"
`define TV_IN_b_fc1 "./c.lenet5.autotvin_b_fc1.dat"
`define TV_IN_feature_in "./c.lenet5.autotvin_feature_in.dat"
`define TV_IN_feature_out "./c.lenet5.autotvin_feature_out.dat"
`define TV_IN_result "./c.lenet5.autotvin_result.dat"
parameter ADDR_WIDTH = 8;
parameter DATA_WIDTH = 32;
parameter w_conv0_DEPTH = 1;
reg [31 : 0] w_conv0_OPERATE_DEPTH = 0;
parameter w_conv0_c_bitwidth = 64;
parameter b_conv0_DEPTH = 1;
reg [31 : 0] b_conv0_OPERATE_DEPTH = 0;
parameter b_conv0_c_bitwidth = 64;
parameter w_conv1_DEPTH = 1;
reg [31 : 0] w_conv1_OPERATE_DEPTH = 0;
parameter w_conv1_c_bitwidth = 64;
parameter b_conv1_DEPTH = 1;
reg [31 : 0] b_conv1_OPERATE_DEPTH = 0;
parameter b_conv1_c_bitwidth = 64;
parameter w_fc0_DEPTH = 1;
reg [31 : 0] w_fc0_OPERATE_DEPTH = 0;
parameter w_fc0_c_bitwidth = 64;
parameter b_fc0_DEPTH = 1;
reg [31 : 0] b_fc0_OPERATE_DEPTH = 0;
parameter b_fc0_c_bitwidth = 64;
parameter w_fc1_DEPTH = 1;
reg [31 : 0] w_fc1_OPERATE_DEPTH = 0;
parameter w_fc1_c_bitwidth = 64;
parameter b_fc1_DEPTH = 1;
reg [31 : 0] b_fc1_OPERATE_DEPTH = 0;
parameter b_fc1_c_bitwidth = 64;
parameter feature_in_DEPTH = 1;
reg [31 : 0] feature_in_OPERATE_DEPTH = 0;
parameter feature_in_c_bitwidth = 64;
parameter feature_out_DEPTH = 1;
reg [31 : 0] feature_out_OPERATE_DEPTH = 0;
parameter feature_out_c_bitwidth = 64;
parameter result_DEPTH = 1;
reg [31 : 0] result_OPERATE_DEPTH = 0;
parameter result_c_bitwidth = 64;
parameter START_ADDR = 0;
parameter lenet5_continue_addr = 0;
parameter lenet5_auto_start_addr = 0;
parameter w_conv0_data_in_addr = 16;
parameter b_conv0_data_in_addr = 28;
parameter w_conv1_data_in_addr = 40;
parameter b_conv1_data_in_addr = 52;
parameter w_fc0_data_in_addr = 64;
parameter b_fc0_data_in_addr = 76;
parameter w_fc1_data_in_addr = 88;
parameter b_fc1_data_in_addr = 100;
parameter feature_in_data_in_addr = 112;
parameter feature_out_data_in_addr = 124;
parameter result_data_in_addr = 136;
parameter STATUS_ADDR = 0;

output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_control_AWADDR;
output  TRAN_s_axi_control_AWVALID;
input  TRAN_s_axi_control_AWREADY;
output  TRAN_s_axi_control_WVALID;
input  TRAN_s_axi_control_WREADY;
output [DATA_WIDTH - 1 : 0] TRAN_s_axi_control_WDATA;
output [DATA_WIDTH/8 - 1 : 0] TRAN_s_axi_control_WSTRB;
output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_control_ARADDR;
output  TRAN_s_axi_control_ARVALID;
input  TRAN_s_axi_control_ARREADY;
input  TRAN_s_axi_control_RVALID;
output  TRAN_s_axi_control_RREADY;
input [DATA_WIDTH - 1 : 0] TRAN_s_axi_control_RDATA;
input [2 - 1 : 0] TRAN_s_axi_control_RRESP;
input  TRAN_s_axi_control_BVALID;
output  TRAN_s_axi_control_BREADY;
input [2 - 1 : 0] TRAN_s_axi_control_BRESP;
output TRAN_control_write_data_finish;
input     clk;
input     reset;
input     TRAN_control_start_in;
output    TRAN_control_done_out;
output    TRAN_control_ready_out;
input     TRAN_control_ready_in;
output    TRAN_control_idle_out;
input  TRAN_control_write_start_in   ;
output TRAN_control_write_start_finish;
input     TRAN_control_interrupt;
input     TRAN_control_transaction_done_in;

reg [ADDR_WIDTH - 1 : 0] AWADDR_reg = 0;
reg  AWVALID_reg = 0;
reg  WVALID_reg = 0;
reg [DATA_WIDTH - 1 : 0] WDATA_reg = 0;
reg [DATA_WIDTH/8 - 1 : 0] WSTRB_reg = 0;
reg [ADDR_WIDTH - 1 : 0] ARADDR_reg = 0;
reg  ARVALID_reg = 0;
reg  RREADY_reg = 0;
reg [DATA_WIDTH - 1 : 0] RDATA_reg = 0;
reg  BREADY_reg = 0;
reg [w_conv0_c_bitwidth - 1 : 0] mem_w_conv0 [w_conv0_DEPTH - 1 : 0];
reg w_conv0_write_data_finish;
reg [b_conv0_c_bitwidth - 1 : 0] mem_b_conv0 [b_conv0_DEPTH - 1 : 0];
reg b_conv0_write_data_finish;
reg [w_conv1_c_bitwidth - 1 : 0] mem_w_conv1 [w_conv1_DEPTH - 1 : 0];
reg w_conv1_write_data_finish;
reg [b_conv1_c_bitwidth - 1 : 0] mem_b_conv1 [b_conv1_DEPTH - 1 : 0];
reg b_conv1_write_data_finish;
reg [w_fc0_c_bitwidth - 1 : 0] mem_w_fc0 [w_fc0_DEPTH - 1 : 0];
reg w_fc0_write_data_finish;
reg [b_fc0_c_bitwidth - 1 : 0] mem_b_fc0 [b_fc0_DEPTH - 1 : 0];
reg b_fc0_write_data_finish;
reg [w_fc1_c_bitwidth - 1 : 0] mem_w_fc1 [w_fc1_DEPTH - 1 : 0];
reg w_fc1_write_data_finish;
reg [b_fc1_c_bitwidth - 1 : 0] mem_b_fc1 [b_fc1_DEPTH - 1 : 0];
reg b_fc1_write_data_finish;
reg [feature_in_c_bitwidth - 1 : 0] mem_feature_in [feature_in_DEPTH - 1 : 0];
reg feature_in_write_data_finish;
reg [feature_out_c_bitwidth - 1 : 0] mem_feature_out [feature_out_DEPTH - 1 : 0];
reg feature_out_write_data_finish;
reg [result_c_bitwidth - 1 : 0] mem_result [result_DEPTH - 1 : 0];
reg result_write_data_finish;
reg AESL_ready_out_index_reg = 0;
reg AESL_write_start_finish = 0;
reg AESL_ready_reg;
reg ready_initial;
reg AESL_done_index_reg = 0;
reg AESL_idle_index_reg = 0;
reg AESL_auto_restart_index_reg;
reg process_0_finish = 0;
reg process_1_finish = 0;
reg process_2_finish = 0;
reg process_3_finish = 0;
reg process_4_finish = 0;
reg process_5_finish = 0;
reg process_6_finish = 0;
reg process_7_finish = 0;
reg process_8_finish = 0;
reg process_9_finish = 0;
reg process_10_finish = 0;
reg process_11_finish = 0;
reg process_12_finish = 0;
//write w_conv0 reg
reg [31 : 0] write_w_conv0_count = 0;
reg write_w_conv0_run_flag = 0;
reg write_one_w_conv0_data_done = 0;
//write b_conv0 reg
reg [31 : 0] write_b_conv0_count = 0;
reg write_b_conv0_run_flag = 0;
reg write_one_b_conv0_data_done = 0;
//write w_conv1 reg
reg [31 : 0] write_w_conv1_count = 0;
reg write_w_conv1_run_flag = 0;
reg write_one_w_conv1_data_done = 0;
//write b_conv1 reg
reg [31 : 0] write_b_conv1_count = 0;
reg write_b_conv1_run_flag = 0;
reg write_one_b_conv1_data_done = 0;
//write w_fc0 reg
reg [31 : 0] write_w_fc0_count = 0;
reg write_w_fc0_run_flag = 0;
reg write_one_w_fc0_data_done = 0;
//write b_fc0 reg
reg [31 : 0] write_b_fc0_count = 0;
reg write_b_fc0_run_flag = 0;
reg write_one_b_fc0_data_done = 0;
//write w_fc1 reg
reg [31 : 0] write_w_fc1_count = 0;
reg write_w_fc1_run_flag = 0;
reg write_one_w_fc1_data_done = 0;
//write b_fc1 reg
reg [31 : 0] write_b_fc1_count = 0;
reg write_b_fc1_run_flag = 0;
reg write_one_b_fc1_data_done = 0;
//write feature_in reg
reg [31 : 0] write_feature_in_count = 0;
reg write_feature_in_run_flag = 0;
reg write_one_feature_in_data_done = 0;
//write feature_out reg
reg [31 : 0] write_feature_out_count = 0;
reg write_feature_out_run_flag = 0;
reg write_one_feature_out_data_done = 0;
//write result reg
reg [31 : 0] write_result_count = 0;
reg write_result_run_flag = 0;
reg write_one_result_data_done = 0;
reg [31 : 0] write_start_count = 0;
reg write_start_run_flag = 0;

//===================process control=================
reg [31 : 0] ongoing_process_number = 0;
//process number depends on how much processes needed.
reg process_busy = 0;

//=================== signal connection ==============
assign TRAN_s_axi_control_AWADDR = AWADDR_reg;
assign TRAN_s_axi_control_AWVALID = AWVALID_reg;
assign TRAN_s_axi_control_WVALID = WVALID_reg;
assign TRAN_s_axi_control_WDATA = WDATA_reg;
assign TRAN_s_axi_control_WSTRB = WSTRB_reg;
assign TRAN_s_axi_control_ARADDR = ARADDR_reg;
assign TRAN_s_axi_control_ARVALID = ARVALID_reg;
assign TRAN_s_axi_control_RREADY = RREADY_reg;
assign TRAN_s_axi_control_BREADY = BREADY_reg;
assign TRAN_control_write_start_finish = AESL_write_start_finish;
assign TRAN_control_done_out = AESL_done_index_reg;
assign TRAN_control_ready_out = AESL_ready_out_index_reg;
assign TRAN_control_idle_out = AESL_idle_index_reg;
assign TRAN_control_write_data_finish = 1 & w_conv0_write_data_finish & b_conv0_write_data_finish & w_conv1_write_data_finish & b_conv1_write_data_finish & w_fc0_write_data_finish & b_fc0_write_data_finish & w_fc1_write_data_finish & b_fc1_write_data_finish & feature_in_write_data_finish & feature_out_write_data_finish & result_write_data_finish;
always @(TRAN_control_ready_in or ready_initial) 
begin
    AESL_ready_reg <= TRAN_control_ready_in | ready_initial;
end

always @(reset or process_0_finish or process_1_finish or process_2_finish or process_3_finish or process_4_finish or process_5_finish or process_6_finish or process_7_finish or process_8_finish or process_9_finish or process_10_finish or process_11_finish or process_12_finish ) begin
    if (reset == 0) begin
        ongoing_process_number <= 0;
    end
    else if (ongoing_process_number == 0 && process_0_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 1 && process_1_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 2 && process_2_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 3 && process_3_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 4 && process_4_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 5 && process_5_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 6 && process_6_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 7 && process_7_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 8 && process_8_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 9 && process_9_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 10 && process_10_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 11 && process_11_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 12 && process_12_finish == 1) begin
            ongoing_process_number <= 0;
    end
end

task count_c_data_four_byte_num_by_bitwidth;
input  integer bitwidth;
output integer num;
integer factor;
integer i;
begin
    factor = 32;
    for (i = 1; i <= 32; i = i + 1) begin
        if (bitwidth <= factor && bitwidth > factor - 32) begin
            num = i;
        end
        factor = factor + 32;
    end
end    
endtask

task count_seperate_factor_by_bitwidth;
input  integer bitwidth;
output integer factor;
begin
    if (bitwidth <= 8) begin
        factor=4;
    end
    if (bitwidth <= 16 & bitwidth > 8 ) begin
        factor=2;
    end
    if (bitwidth <= 32 & bitwidth > 16 ) begin
        factor=1;
    end
    if (bitwidth <= 1024 & bitwidth > 32 ) begin
        factor=1;
    end
end    
endtask

task count_operate_depth_by_bitwidth_and_depth;
input  integer bitwidth;
input  integer depth;
output integer operate_depth;
integer factor;
integer remain;
begin
    count_seperate_factor_by_bitwidth (bitwidth , factor);
    operate_depth = depth / factor;
    remain = depth % factor;
    if (remain > 0) begin
        operate_depth = operate_depth + 1;
    end
end    
endtask

task write; /*{{{*/
    input  reg [ADDR_WIDTH - 1:0] waddr;   // write address
    input  reg [DATA_WIDTH - 1:0] wdata;   // write data
    output reg wresp;
    reg aw_flag;
    reg w_flag;
    reg [DATA_WIDTH/8 - 1:0] wstrb_reg;
    integer i;
begin 
    wresp = 0;
    aw_flag = 0;
    w_flag = 0;
//=======================one single write operate======================
    AWADDR_reg <= waddr;
    AWVALID_reg <= 1;
    WDATA_reg <= wdata;
    WVALID_reg <= 1;
    for (i = 0; i < DATA_WIDTH/8; i = i + 1) begin
        wstrb_reg [i] = 1;
    end    
    WSTRB_reg <= wstrb_reg;
    while (!(aw_flag && w_flag)) begin
        @(posedge clk);
        if (aw_flag != 1)
            aw_flag = TRAN_s_axi_control_AWREADY & AWVALID_reg;
        if (w_flag != 1)
            w_flag = TRAN_s_axi_control_WREADY & WVALID_reg;
        AWVALID_reg <= !aw_flag;
        WVALID_reg <= !w_flag;
    end

    BREADY_reg <= 1;
    while (TRAN_s_axi_control_BVALID != 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    BREADY_reg <= 0;
    if (TRAN_s_axi_control_BRESP === 2'b00) begin
        wresp = 1;
        //input success. in fact BRESP is always 2'b00
    end   
//=======================one single write operate======================

end
endtask/*}}}*/

task read (/*{{{*/
    input  [ADDR_WIDTH - 1:0] raddr ,   // write address
    output [DATA_WIDTH - 1:0] RDATA_result ,
    output rresp
);
begin 
    rresp = 0;
//=======================one single read operate======================
    ARADDR_reg <= raddr;
    ARVALID_reg <= 1;
    while (TRAN_s_axi_control_ARREADY !== 1) begin
        @(posedge clk);
    end
    @(posedge clk);
    ARVALID_reg <= 0;
    RREADY_reg <= 1;
    while (TRAN_s_axi_control_RVALID !== 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    RDATA_result  <= TRAN_s_axi_control_RDATA;
    RREADY_reg <= 0;
    if (TRAN_s_axi_control_RRESP === 2'b00 ) begin
        rresp <= 1;
        //output success. in fact RRESP is always 2'b00
    end  
    @(posedge clk);

//=======================one single read operate end======================

end
endtask/*}}}*/

initial begin : ready_initial_process
    ready_initial = 0;
    wait(reset === 1);
    @(posedge clk);
    ready_initial = 1;
    @(posedge clk);
    ready_initial = 0;
end

initial begin : update_status
    integer process_num ;
    integer read_status_resp;
    wait(reset === 1);
    @(posedge clk);
    process_num = 0;
    while (1) begin
        process_0_finish = 0;
        AESL_done_index_reg         <= 0;
        AESL_ready_out_index_reg        <= 0;
        if (ongoing_process_number === process_num && process_busy === 0) begin
            process_busy = 1;
            read (STATUS_ADDR, RDATA_reg, read_status_resp);
                AESL_done_index_reg         <= RDATA_reg[1 : 1];
                AESL_ready_out_index_reg    <= RDATA_reg[1 : 1];
                AESL_idle_index_reg         <= RDATA_reg[2 : 2];
            process_0_finish = 1;
            process_busy = 0;
        end 
        @(posedge clk);
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        w_conv0_write_data_finish <= 0;
        write_w_conv0_run_flag <= 0; 
        write_w_conv0_count = 0;
        count_operate_depth_by_bitwidth_and_depth (w_conv0_c_bitwidth, w_conv0_DEPTH, w_conv0_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            w_conv0_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_w_conv0_run_flag <= 1; 
            write_w_conv0_count = 0;
        end
        if (write_one_w_conv0_data_done === 1) begin
            write_w_conv0_count = write_w_conv0_count + 1;
            if (write_w_conv0_count == w_conv0_OPERATE_DEPTH) begin
                write_w_conv0_run_flag <= 0; 
                w_conv0_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_w_conv0
    integer write_w_conv0_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] w_conv0_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = w_conv0_c_bitwidth;
    process_num = 1;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_1_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_w_conv0_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write w_conv0 data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (w_conv0_c_bitwidth < 32) begin
                        w_conv0_data_tmp_reg = mem_w_conv0[write_w_conv0_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < w_conv0_c_bitwidth) begin
                                w_conv0_data_tmp_reg[j] = mem_w_conv0[write_w_conv0_count][i*32 + j];
                            end
                            else begin
                                w_conv0_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (w_conv0_data_in_addr + write_w_conv0_count * four_byte_num * 4 + i * 4, w_conv0_data_tmp_reg, write_w_conv0_resp);
                end
                process_busy = 0;
                write_one_w_conv0_data_done <= 1;
                @(posedge clk);
                write_one_w_conv0_data_done <= 0;
            end   
            process_1_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        b_conv0_write_data_finish <= 0;
        write_b_conv0_run_flag <= 0; 
        write_b_conv0_count = 0;
        count_operate_depth_by_bitwidth_and_depth (b_conv0_c_bitwidth, b_conv0_DEPTH, b_conv0_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            b_conv0_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_b_conv0_run_flag <= 1; 
            write_b_conv0_count = 0;
        end
        if (write_one_b_conv0_data_done === 1) begin
            write_b_conv0_count = write_b_conv0_count + 1;
            if (write_b_conv0_count == b_conv0_OPERATE_DEPTH) begin
                write_b_conv0_run_flag <= 0; 
                b_conv0_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_b_conv0
    integer write_b_conv0_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] b_conv0_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = b_conv0_c_bitwidth;
    process_num = 2;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_2_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_b_conv0_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write b_conv0 data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (b_conv0_c_bitwidth < 32) begin
                        b_conv0_data_tmp_reg = mem_b_conv0[write_b_conv0_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < b_conv0_c_bitwidth) begin
                                b_conv0_data_tmp_reg[j] = mem_b_conv0[write_b_conv0_count][i*32 + j];
                            end
                            else begin
                                b_conv0_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (b_conv0_data_in_addr + write_b_conv0_count * four_byte_num * 4 + i * 4, b_conv0_data_tmp_reg, write_b_conv0_resp);
                end
                process_busy = 0;
                write_one_b_conv0_data_done <= 1;
                @(posedge clk);
                write_one_b_conv0_data_done <= 0;
            end   
            process_2_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        w_conv1_write_data_finish <= 0;
        write_w_conv1_run_flag <= 0; 
        write_w_conv1_count = 0;
        count_operate_depth_by_bitwidth_and_depth (w_conv1_c_bitwidth, w_conv1_DEPTH, w_conv1_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            w_conv1_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_w_conv1_run_flag <= 1; 
            write_w_conv1_count = 0;
        end
        if (write_one_w_conv1_data_done === 1) begin
            write_w_conv1_count = write_w_conv1_count + 1;
            if (write_w_conv1_count == w_conv1_OPERATE_DEPTH) begin
                write_w_conv1_run_flag <= 0; 
                w_conv1_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_w_conv1
    integer write_w_conv1_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] w_conv1_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = w_conv1_c_bitwidth;
    process_num = 3;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_3_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_w_conv1_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write w_conv1 data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (w_conv1_c_bitwidth < 32) begin
                        w_conv1_data_tmp_reg = mem_w_conv1[write_w_conv1_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < w_conv1_c_bitwidth) begin
                                w_conv1_data_tmp_reg[j] = mem_w_conv1[write_w_conv1_count][i*32 + j];
                            end
                            else begin
                                w_conv1_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (w_conv1_data_in_addr + write_w_conv1_count * four_byte_num * 4 + i * 4, w_conv1_data_tmp_reg, write_w_conv1_resp);
                end
                process_busy = 0;
                write_one_w_conv1_data_done <= 1;
                @(posedge clk);
                write_one_w_conv1_data_done <= 0;
            end   
            process_3_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        b_conv1_write_data_finish <= 0;
        write_b_conv1_run_flag <= 0; 
        write_b_conv1_count = 0;
        count_operate_depth_by_bitwidth_and_depth (b_conv1_c_bitwidth, b_conv1_DEPTH, b_conv1_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            b_conv1_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_b_conv1_run_flag <= 1; 
            write_b_conv1_count = 0;
        end
        if (write_one_b_conv1_data_done === 1) begin
            write_b_conv1_count = write_b_conv1_count + 1;
            if (write_b_conv1_count == b_conv1_OPERATE_DEPTH) begin
                write_b_conv1_run_flag <= 0; 
                b_conv1_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_b_conv1
    integer write_b_conv1_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] b_conv1_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = b_conv1_c_bitwidth;
    process_num = 4;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_4_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_b_conv1_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write b_conv1 data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (b_conv1_c_bitwidth < 32) begin
                        b_conv1_data_tmp_reg = mem_b_conv1[write_b_conv1_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < b_conv1_c_bitwidth) begin
                                b_conv1_data_tmp_reg[j] = mem_b_conv1[write_b_conv1_count][i*32 + j];
                            end
                            else begin
                                b_conv1_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (b_conv1_data_in_addr + write_b_conv1_count * four_byte_num * 4 + i * 4, b_conv1_data_tmp_reg, write_b_conv1_resp);
                end
                process_busy = 0;
                write_one_b_conv1_data_done <= 1;
                @(posedge clk);
                write_one_b_conv1_data_done <= 0;
            end   
            process_4_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        w_fc0_write_data_finish <= 0;
        write_w_fc0_run_flag <= 0; 
        write_w_fc0_count = 0;
        count_operate_depth_by_bitwidth_and_depth (w_fc0_c_bitwidth, w_fc0_DEPTH, w_fc0_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            w_fc0_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_w_fc0_run_flag <= 1; 
            write_w_fc0_count = 0;
        end
        if (write_one_w_fc0_data_done === 1) begin
            write_w_fc0_count = write_w_fc0_count + 1;
            if (write_w_fc0_count == w_fc0_OPERATE_DEPTH) begin
                write_w_fc0_run_flag <= 0; 
                w_fc0_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_w_fc0
    integer write_w_fc0_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] w_fc0_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = w_fc0_c_bitwidth;
    process_num = 5;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_5_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_w_fc0_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write w_fc0 data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (w_fc0_c_bitwidth < 32) begin
                        w_fc0_data_tmp_reg = mem_w_fc0[write_w_fc0_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < w_fc0_c_bitwidth) begin
                                w_fc0_data_tmp_reg[j] = mem_w_fc0[write_w_fc0_count][i*32 + j];
                            end
                            else begin
                                w_fc0_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (w_fc0_data_in_addr + write_w_fc0_count * four_byte_num * 4 + i * 4, w_fc0_data_tmp_reg, write_w_fc0_resp);
                end
                process_busy = 0;
                write_one_w_fc0_data_done <= 1;
                @(posedge clk);
                write_one_w_fc0_data_done <= 0;
            end   
            process_5_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        b_fc0_write_data_finish <= 0;
        write_b_fc0_run_flag <= 0; 
        write_b_fc0_count = 0;
        count_operate_depth_by_bitwidth_and_depth (b_fc0_c_bitwidth, b_fc0_DEPTH, b_fc0_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            b_fc0_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_b_fc0_run_flag <= 1; 
            write_b_fc0_count = 0;
        end
        if (write_one_b_fc0_data_done === 1) begin
            write_b_fc0_count = write_b_fc0_count + 1;
            if (write_b_fc0_count == b_fc0_OPERATE_DEPTH) begin
                write_b_fc0_run_flag <= 0; 
                b_fc0_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_b_fc0
    integer write_b_fc0_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] b_fc0_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = b_fc0_c_bitwidth;
    process_num = 6;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_6_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_b_fc0_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write b_fc0 data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (b_fc0_c_bitwidth < 32) begin
                        b_fc0_data_tmp_reg = mem_b_fc0[write_b_fc0_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < b_fc0_c_bitwidth) begin
                                b_fc0_data_tmp_reg[j] = mem_b_fc0[write_b_fc0_count][i*32 + j];
                            end
                            else begin
                                b_fc0_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (b_fc0_data_in_addr + write_b_fc0_count * four_byte_num * 4 + i * 4, b_fc0_data_tmp_reg, write_b_fc0_resp);
                end
                process_busy = 0;
                write_one_b_fc0_data_done <= 1;
                @(posedge clk);
                write_one_b_fc0_data_done <= 0;
            end   
            process_6_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        w_fc1_write_data_finish <= 0;
        write_w_fc1_run_flag <= 0; 
        write_w_fc1_count = 0;
        count_operate_depth_by_bitwidth_and_depth (w_fc1_c_bitwidth, w_fc1_DEPTH, w_fc1_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            w_fc1_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_w_fc1_run_flag <= 1; 
            write_w_fc1_count = 0;
        end
        if (write_one_w_fc1_data_done === 1) begin
            write_w_fc1_count = write_w_fc1_count + 1;
            if (write_w_fc1_count == w_fc1_OPERATE_DEPTH) begin
                write_w_fc1_run_flag <= 0; 
                w_fc1_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_w_fc1
    integer write_w_fc1_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] w_fc1_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = w_fc1_c_bitwidth;
    process_num = 7;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_7_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_w_fc1_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write w_fc1 data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (w_fc1_c_bitwidth < 32) begin
                        w_fc1_data_tmp_reg = mem_w_fc1[write_w_fc1_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < w_fc1_c_bitwidth) begin
                                w_fc1_data_tmp_reg[j] = mem_w_fc1[write_w_fc1_count][i*32 + j];
                            end
                            else begin
                                w_fc1_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (w_fc1_data_in_addr + write_w_fc1_count * four_byte_num * 4 + i * 4, w_fc1_data_tmp_reg, write_w_fc1_resp);
                end
                process_busy = 0;
                write_one_w_fc1_data_done <= 1;
                @(posedge clk);
                write_one_w_fc1_data_done <= 0;
            end   
            process_7_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        b_fc1_write_data_finish <= 0;
        write_b_fc1_run_flag <= 0; 
        write_b_fc1_count = 0;
        count_operate_depth_by_bitwidth_and_depth (b_fc1_c_bitwidth, b_fc1_DEPTH, b_fc1_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            b_fc1_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_b_fc1_run_flag <= 1; 
            write_b_fc1_count = 0;
        end
        if (write_one_b_fc1_data_done === 1) begin
            write_b_fc1_count = write_b_fc1_count + 1;
            if (write_b_fc1_count == b_fc1_OPERATE_DEPTH) begin
                write_b_fc1_run_flag <= 0; 
                b_fc1_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_b_fc1
    integer write_b_fc1_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] b_fc1_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = b_fc1_c_bitwidth;
    process_num = 8;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_8_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_b_fc1_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write b_fc1 data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (b_fc1_c_bitwidth < 32) begin
                        b_fc1_data_tmp_reg = mem_b_fc1[write_b_fc1_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < b_fc1_c_bitwidth) begin
                                b_fc1_data_tmp_reg[j] = mem_b_fc1[write_b_fc1_count][i*32 + j];
                            end
                            else begin
                                b_fc1_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (b_fc1_data_in_addr + write_b_fc1_count * four_byte_num * 4 + i * 4, b_fc1_data_tmp_reg, write_b_fc1_resp);
                end
                process_busy = 0;
                write_one_b_fc1_data_done <= 1;
                @(posedge clk);
                write_one_b_fc1_data_done <= 0;
            end   
            process_8_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        feature_in_write_data_finish <= 0;
        write_feature_in_run_flag <= 0; 
        write_feature_in_count = 0;
        count_operate_depth_by_bitwidth_and_depth (feature_in_c_bitwidth, feature_in_DEPTH, feature_in_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            feature_in_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_feature_in_run_flag <= 1; 
            write_feature_in_count = 0;
        end
        if (write_one_feature_in_data_done === 1) begin
            write_feature_in_count = write_feature_in_count + 1;
            if (write_feature_in_count == feature_in_OPERATE_DEPTH) begin
                write_feature_in_run_flag <= 0; 
                feature_in_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_feature_in
    integer write_feature_in_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] feature_in_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = feature_in_c_bitwidth;
    process_num = 9;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_9_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_feature_in_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write feature_in data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (feature_in_c_bitwidth < 32) begin
                        feature_in_data_tmp_reg = mem_feature_in[write_feature_in_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < feature_in_c_bitwidth) begin
                                feature_in_data_tmp_reg[j] = mem_feature_in[write_feature_in_count][i*32 + j];
                            end
                            else begin
                                feature_in_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (feature_in_data_in_addr + write_feature_in_count * four_byte_num * 4 + i * 4, feature_in_data_tmp_reg, write_feature_in_resp);
                end
                process_busy = 0;
                write_one_feature_in_data_done <= 1;
                @(posedge clk);
                write_one_feature_in_data_done <= 0;
            end   
            process_9_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        feature_out_write_data_finish <= 0;
        write_feature_out_run_flag <= 0; 
        write_feature_out_count = 0;
        count_operate_depth_by_bitwidth_and_depth (feature_out_c_bitwidth, feature_out_DEPTH, feature_out_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            feature_out_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_feature_out_run_flag <= 1; 
            write_feature_out_count = 0;
        end
        if (write_one_feature_out_data_done === 1) begin
            write_feature_out_count = write_feature_out_count + 1;
            if (write_feature_out_count == feature_out_OPERATE_DEPTH) begin
                write_feature_out_run_flag <= 0; 
                feature_out_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_feature_out
    integer write_feature_out_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] feature_out_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = feature_out_c_bitwidth;
    process_num = 10;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_10_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_feature_out_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write feature_out data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (feature_out_c_bitwidth < 32) begin
                        feature_out_data_tmp_reg = mem_feature_out[write_feature_out_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < feature_out_c_bitwidth) begin
                                feature_out_data_tmp_reg[j] = mem_feature_out[write_feature_out_count][i*32 + j];
                            end
                            else begin
                                feature_out_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (feature_out_data_in_addr + write_feature_out_count * four_byte_num * 4 + i * 4, feature_out_data_tmp_reg, write_feature_out_resp);
                end
                process_busy = 0;
                write_one_feature_out_data_done <= 1;
                @(posedge clk);
                write_one_feature_out_data_done <= 0;
            end   
            process_10_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        result_write_data_finish <= 0;
        write_result_run_flag <= 0; 
        write_result_count = 0;
        count_operate_depth_by_bitwidth_and_depth (result_c_bitwidth, result_DEPTH, result_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            result_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_result_run_flag <= 1; 
            write_result_count = 0;
        end
        if (write_one_result_data_done === 1) begin
            write_result_count = write_result_count + 1;
            if (write_result_count == result_OPERATE_DEPTH) begin
                write_result_run_flag <= 0; 
                result_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_result
    integer write_result_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] result_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = result_c_bitwidth;
    process_num = 11;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_11_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_result_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write result data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (result_c_bitwidth < 32) begin
                        result_data_tmp_reg = mem_result[write_result_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < result_c_bitwidth) begin
                                result_data_tmp_reg[j] = mem_result[write_result_count][i*32 + j];
                            end
                            else begin
                                result_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (result_data_in_addr + write_result_count * four_byte_num * 4 + i * 4, result_data_tmp_reg, write_result_resp);
                end
                process_busy = 0;
                write_one_result_data_done <= 1;
                @(posedge clk);
                write_one_result_data_done <= 0;
            end   
            process_11_finish <= 1;
        end
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_start_run_flag <= 0; 
        write_start_count <= 0;
    end
    else begin
        if (write_start_count >= 1) begin
            write_start_run_flag <= 0; 
        end
        else if (TRAN_control_write_start_in === 1) begin
            write_start_run_flag <= 1; 
        end
        if (AESL_write_start_finish === 1) begin
            write_start_count <= write_start_count + 1;
            write_start_run_flag <= 0; 
        end
    end
end

initial begin : write_start
    reg [DATA_WIDTH - 1 : 0] write_start_tmp;
    integer process_num;
    integer write_start_resp;
    wait(reset === 1);
    @(posedge clk);
    process_num = 12;
    while (1) begin
        process_12_finish = 0;
        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            if (write_start_run_flag === 1) begin
                process_busy = 1;
                write_start_tmp=0;
                write_start_tmp[0 : 0] = 1;
                write (START_ADDR, write_start_tmp, write_start_resp);
                process_busy = 0;
                AESL_write_start_finish <= 1;
                @(posedge clk);
                AESL_write_start_finish <= 0;
            end
            process_12_finish <= 1;
        end 
        @(posedge clk);
    end
end

//------------------------Task and function-------------- 
task read_token; 
    input integer fp; 
    output reg [151 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end 
endtask 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_w_conv0_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [w_conv0_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (w_conv0_c_bitwidth , factor);
  fp = $fopen(`TV_IN_w_conv0 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_w_conv0); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < w_conv0_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_w_conv0 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_w_conv0 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_w_conv0 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_w_conv0 [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_w_conv0 [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_b_conv0_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [b_conv0_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (b_conv0_c_bitwidth , factor);
  fp = $fopen(`TV_IN_b_conv0 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_b_conv0); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < b_conv0_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_b_conv0 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_b_conv0 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_b_conv0 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_b_conv0 [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_b_conv0 [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_w_conv1_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [w_conv1_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (w_conv1_c_bitwidth , factor);
  fp = $fopen(`TV_IN_w_conv1 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_w_conv1); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < w_conv1_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_w_conv1 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_w_conv1 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_w_conv1 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_w_conv1 [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_w_conv1 [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_b_conv1_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [b_conv1_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (b_conv1_c_bitwidth , factor);
  fp = $fopen(`TV_IN_b_conv1 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_b_conv1); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < b_conv1_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_b_conv1 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_b_conv1 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_b_conv1 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_b_conv1 [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_b_conv1 [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_w_fc0_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [w_fc0_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (w_fc0_c_bitwidth , factor);
  fp = $fopen(`TV_IN_w_fc0 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_w_fc0); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < w_fc0_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_w_fc0 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_w_fc0 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_w_fc0 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_w_fc0 [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_w_fc0 [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_b_fc0_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [b_fc0_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (b_fc0_c_bitwidth , factor);
  fp = $fopen(`TV_IN_b_fc0 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_b_fc0); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < b_fc0_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_b_fc0 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_b_fc0 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_b_fc0 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_b_fc0 [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_b_fc0 [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_w_fc1_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [w_fc1_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (w_fc1_c_bitwidth , factor);
  fp = $fopen(`TV_IN_w_fc1 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_w_fc1); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < w_fc1_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_w_fc1 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_w_fc1 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_w_fc1 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_w_fc1 [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_w_fc1 [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_b_fc1_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [b_fc1_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (b_fc1_c_bitwidth , factor);
  fp = $fopen(`TV_IN_b_fc1 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_b_fc1); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < b_fc1_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_b_fc1 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_b_fc1 [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_b_fc1 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_b_fc1 [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_b_fc1 [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_feature_in_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [feature_in_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (feature_in_c_bitwidth , factor);
  fp = $fopen(`TV_IN_feature_in ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_feature_in); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < feature_in_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_feature_in [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_feature_in [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_feature_in [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_feature_in [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_feature_in [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_feature_out_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [feature_out_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (feature_out_c_bitwidth , factor);
  fp = $fopen(`TV_IN_feature_out ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_feature_out); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < feature_out_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_feature_out [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_feature_out [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_feature_out [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_feature_out [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_feature_out [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_result_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [result_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (result_c_bitwidth , factor);
  fp = $fopen(`TV_IN_result ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_result); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < result_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_result [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_result [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_result [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_result [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_result [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
endmodule
