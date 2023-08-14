#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_gmem "../tv/cdatafile/c.lenet5.autotvin_gmem.dat"
#define AUTOTB_TVOUT_gmem "../tv/cdatafile/c.lenet5.autotvout_gmem.dat"
// wrapc file define:
#define AUTOTB_TVIN_w_conv0 "../tv/cdatafile/c.lenet5.autotvin_w_conv0.dat"
#define AUTOTB_TVOUT_w_conv0 "../tv/cdatafile/c.lenet5.autotvout_w_conv0.dat"
// wrapc file define:
#define AUTOTB_TVIN_b_conv0 "../tv/cdatafile/c.lenet5.autotvin_b_conv0.dat"
#define AUTOTB_TVOUT_b_conv0 "../tv/cdatafile/c.lenet5.autotvout_b_conv0.dat"
// wrapc file define:
#define AUTOTB_TVIN_w_conv1 "../tv/cdatafile/c.lenet5.autotvin_w_conv1.dat"
#define AUTOTB_TVOUT_w_conv1 "../tv/cdatafile/c.lenet5.autotvout_w_conv1.dat"
// wrapc file define:
#define AUTOTB_TVIN_b_conv1 "../tv/cdatafile/c.lenet5.autotvin_b_conv1.dat"
#define AUTOTB_TVOUT_b_conv1 "../tv/cdatafile/c.lenet5.autotvout_b_conv1.dat"
// wrapc file define:
#define AUTOTB_TVIN_w_fc0 "../tv/cdatafile/c.lenet5.autotvin_w_fc0.dat"
#define AUTOTB_TVOUT_w_fc0 "../tv/cdatafile/c.lenet5.autotvout_w_fc0.dat"
// wrapc file define:
#define AUTOTB_TVIN_b_fc0 "../tv/cdatafile/c.lenet5.autotvin_b_fc0.dat"
#define AUTOTB_TVOUT_b_fc0 "../tv/cdatafile/c.lenet5.autotvout_b_fc0.dat"
// wrapc file define:
#define AUTOTB_TVIN_w_fc1 "../tv/cdatafile/c.lenet5.autotvin_w_fc1.dat"
#define AUTOTB_TVOUT_w_fc1 "../tv/cdatafile/c.lenet5.autotvout_w_fc1.dat"
// wrapc file define:
#define AUTOTB_TVIN_b_fc1 "../tv/cdatafile/c.lenet5.autotvin_b_fc1.dat"
#define AUTOTB_TVOUT_b_fc1 "../tv/cdatafile/c.lenet5.autotvout_b_fc1.dat"
// wrapc file define:
#define AUTOTB_TVIN_feature_in "../tv/cdatafile/c.lenet5.autotvin_feature_in.dat"
#define AUTOTB_TVOUT_feature_in "../tv/cdatafile/c.lenet5.autotvout_feature_in.dat"
// wrapc file define:
#define AUTOTB_TVIN_feature_out "../tv/cdatafile/c.lenet5.autotvin_feature_out.dat"
#define AUTOTB_TVOUT_feature_out "../tv/cdatafile/c.lenet5.autotvout_feature_out.dat"
// wrapc file define:
#define AUTOTB_TVIN_result "../tv/cdatafile/c.lenet5.autotvin_result.dat"
#define AUTOTB_TVOUT_result "../tv/cdatafile/c.lenet5.autotvout_result.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_gmem "../tv/rtldatafile/rtl.lenet5.autotvout_gmem.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_w_conv0 "../tv/rtldatafile/rtl.lenet5.autotvout_w_conv0.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_b_conv0 "../tv/rtldatafile/rtl.lenet5.autotvout_b_conv0.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_w_conv1 "../tv/rtldatafile/rtl.lenet5.autotvout_w_conv1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_b_conv1 "../tv/rtldatafile/rtl.lenet5.autotvout_b_conv1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_w_fc0 "../tv/rtldatafile/rtl.lenet5.autotvout_w_fc0.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_b_fc0 "../tv/rtldatafile/rtl.lenet5.autotvout_b_fc0.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_w_fc1 "../tv/rtldatafile/rtl.lenet5.autotvout_w_fc1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_b_fc1 "../tv/rtldatafile/rtl.lenet5.autotvout_b_fc1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_feature_in "../tv/rtldatafile/rtl.lenet5.autotvout_feature_in.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_feature_out "../tv/rtldatafile/rtl.lenet5.autotvout_feature_out.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_result "../tv/rtldatafile/rtl.lenet5.autotvout_result.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  gmem_depth = 0;
  w_conv0_depth = 0;
  b_conv0_depth = 0;
  w_conv1_depth = 0;
  b_conv1_depth = 0;
  w_fc0_depth = 0;
  b_fc0_depth = 0;
  w_fc1_depth = 0;
  b_fc1_depth = 0;
  feature_in_depth = 0;
  feature_out_depth = 0;
  result_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{gmem " << gmem_depth << "}\n";
  total_list << "{w_conv0 " << w_conv0_depth << "}\n";
  total_list << "{b_conv0 " << b_conv0_depth << "}\n";
  total_list << "{w_conv1 " << w_conv1_depth << "}\n";
  total_list << "{b_conv1 " << b_conv1_depth << "}\n";
  total_list << "{w_fc0 " << w_fc0_depth << "}\n";
  total_list << "{b_fc0 " << b_fc0_depth << "}\n";
  total_list << "{w_fc1 " << w_fc1_depth << "}\n";
  total_list << "{b_fc1 " << b_fc1_depth << "}\n";
  total_list << "{feature_in " << feature_in_depth << "}\n";
  total_list << "{feature_out " << feature_out_depth << "}\n";
  total_list << "{result " << result_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int gmem_depth;
    int w_conv0_depth;
    int b_conv0_depth;
    int w_conv1_depth;
    int b_conv1_depth;
    int w_fc0_depth;
    int b_fc0_depth;
    int w_fc1_depth;
    int b_fc1_depth;
    int feature_in_depth;
    int feature_out_depth;
    int result_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
extern "C" void lenet5_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_lenet5_hw(volatile void * __xlx_apatb_param_w_conv0, volatile void * __xlx_apatb_param_b_conv0, volatile void * __xlx_apatb_param_w_conv1, volatile void * __xlx_apatb_param_b_conv1, volatile void * __xlx_apatb_param_w_fc0, volatile void * __xlx_apatb_param_b_fc0, volatile void * __xlx_apatb_param_w_fc1, volatile void * __xlx_apatb_param_b_fc1, volatile void * __xlx_apatb_param_feature_in, volatile void * __xlx_apatb_param_feature_out, volatile void * __xlx_apatb_param_result) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_gmem);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > gmem_pc_buffer(80997);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "gmem");
  
            // push token into output port buffer
            if (AESL_token != "") {
              gmem_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 400; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_w_conv0)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 16; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_b_conv0)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 12800; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_w_conv1)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 32; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_b_conv1)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 65536; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_w_fc0)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 128; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_b_fc0)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 1280; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_w_fc1)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 10; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_b_fc1)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 784; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_feature_in)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 10; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_feature_out)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 1; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_result)[j] = gmem_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//gmem
aesl_fh.touch(AUTOTB_TVIN_gmem);
aesl_fh.touch(AUTOTB_TVOUT_gmem);
//w_conv0
aesl_fh.touch(AUTOTB_TVIN_w_conv0);
aesl_fh.touch(AUTOTB_TVOUT_w_conv0);
//b_conv0
aesl_fh.touch(AUTOTB_TVIN_b_conv0);
aesl_fh.touch(AUTOTB_TVOUT_b_conv0);
//w_conv1
aesl_fh.touch(AUTOTB_TVIN_w_conv1);
aesl_fh.touch(AUTOTB_TVOUT_w_conv1);
//b_conv1
aesl_fh.touch(AUTOTB_TVIN_b_conv1);
aesl_fh.touch(AUTOTB_TVOUT_b_conv1);
//w_fc0
aesl_fh.touch(AUTOTB_TVIN_w_fc0);
aesl_fh.touch(AUTOTB_TVOUT_w_fc0);
//b_fc0
aesl_fh.touch(AUTOTB_TVIN_b_fc0);
aesl_fh.touch(AUTOTB_TVOUT_b_fc0);
//w_fc1
aesl_fh.touch(AUTOTB_TVIN_w_fc1);
aesl_fh.touch(AUTOTB_TVOUT_w_fc1);
//b_fc1
aesl_fh.touch(AUTOTB_TVIN_b_fc1);
aesl_fh.touch(AUTOTB_TVOUT_b_fc1);
//feature_in
aesl_fh.touch(AUTOTB_TVIN_feature_in);
aesl_fh.touch(AUTOTB_TVOUT_feature_in);
//feature_out
aesl_fh.touch(AUTOTB_TVIN_feature_out);
aesl_fh.touch(AUTOTB_TVOUT_feature_out);
//result
aesl_fh.touch(AUTOTB_TVIN_result);
aesl_fh.touch(AUTOTB_TVOUT_result);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_w_conv0 = 0;
unsigned __xlx_offset_byte_param_b_conv0 = 0;
unsigned __xlx_offset_byte_param_w_conv1 = 0;
unsigned __xlx_offset_byte_param_b_conv1 = 0;
unsigned __xlx_offset_byte_param_w_fc0 = 0;
unsigned __xlx_offset_byte_param_b_fc0 = 0;
unsigned __xlx_offset_byte_param_w_fc1 = 0;
unsigned __xlx_offset_byte_param_b_fc1 = 0;
unsigned __xlx_offset_byte_param_feature_in = 0;
unsigned __xlx_offset_byte_param_feature_out = 0;
unsigned __xlx_offset_byte_param_result = 0;
// print gmem Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_w_conv0 = 0*4;
  if (__xlx_apatb_param_w_conv0) {
    for (int j = 0  - 0, e = 400 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_w_conv0)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_b_conv0 = 400*4;
  if (__xlx_apatb_param_b_conv0) {
    for (int j = 0  - 0, e = 16 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_b_conv0)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_w_conv1 = 416*4;
  if (__xlx_apatb_param_w_conv1) {
    for (int j = 0  - 0, e = 12800 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_w_conv1)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_b_conv1 = 13216*4;
  if (__xlx_apatb_param_b_conv1) {
    for (int j = 0  - 0, e = 32 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_b_conv1)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_w_fc0 = 13248*4;
  if (__xlx_apatb_param_w_fc0) {
    for (int j = 0  - 0, e = 65536 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_w_fc0)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_b_fc0 = 78784*4;
  if (__xlx_apatb_param_b_fc0) {
    for (int j = 0  - 0, e = 128 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_b_fc0)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_w_fc1 = 78912*4;
  if (__xlx_apatb_param_w_fc1) {
    for (int j = 0  - 0, e = 1280 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_w_fc1)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_b_fc1 = 80192*4;
  if (__xlx_apatb_param_b_fc1) {
    for (int j = 0  - 0, e = 10 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_b_fc1)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_feature_in = 80202*4;
  if (__xlx_apatb_param_feature_in) {
    for (int j = 0  - 0, e = 784 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_feature_in)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_feature_out = 80986*4;
  if (__xlx_apatb_param_feature_out) {
    for (int j = 0  - 0, e = 10 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_feature_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_result = 80996*4;
  if (__xlx_apatb_param_result) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_result)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(80997, &tcl_file.gmem_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data());
}
// print w_conv0 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_w_conv0, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_w_conv0;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_w_conv0, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.w_conv0_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_w_conv0, __xlx_sprintf_buffer.data());
}
// print b_conv0 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_b_conv0, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_b_conv0;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_b_conv0, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.b_conv0_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_b_conv0, __xlx_sprintf_buffer.data());
}
// print w_conv1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_w_conv1, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_w_conv1;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_w_conv1, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.w_conv1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_w_conv1, __xlx_sprintf_buffer.data());
}
// print b_conv1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_b_conv1, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_b_conv1;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_b_conv1, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.b_conv1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_b_conv1, __xlx_sprintf_buffer.data());
}
// print w_fc0 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_w_fc0, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_w_fc0;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_w_fc0, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.w_fc0_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_w_fc0, __xlx_sprintf_buffer.data());
}
// print b_fc0 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_b_fc0, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_b_fc0;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_b_fc0, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.b_fc0_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_b_fc0, __xlx_sprintf_buffer.data());
}
// print w_fc1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_w_fc1, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_w_fc1;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_w_fc1, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.w_fc1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_w_fc1, __xlx_sprintf_buffer.data());
}
// print b_fc1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_b_fc1, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_b_fc1;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_b_fc1, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.b_fc1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_b_fc1, __xlx_sprintf_buffer.data());
}
// print feature_in Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_feature_in, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_feature_in;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_feature_in, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.feature_in_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_feature_in, __xlx_sprintf_buffer.data());
}
// print feature_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_feature_out, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_feature_out;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_feature_out, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.feature_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_feature_out, __xlx_sprintf_buffer.data());
}
// print result Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_result, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_result;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_result, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.result_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_result, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
lenet5_hw_stub_wrapper(__xlx_apatb_param_w_conv0, __xlx_apatb_param_b_conv0, __xlx_apatb_param_w_conv1, __xlx_apatb_param_b_conv1, __xlx_apatb_param_w_fc0, __xlx_apatb_param_b_fc0, __xlx_apatb_param_w_fc1, __xlx_apatb_param_b_fc1, __xlx_apatb_param_feature_in, __xlx_apatb_param_feature_out, __xlx_apatb_param_result);
CodeState = DUMP_OUTPUTS;
// print gmem Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_w_conv0 = 0*4;
  if (__xlx_apatb_param_w_conv0) {
    for (int j = 0  - 0, e = 400 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_w_conv0)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_b_conv0 = 400*4;
  if (__xlx_apatb_param_b_conv0) {
    for (int j = 0  - 0, e = 16 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_b_conv0)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_w_conv1 = 416*4;
  if (__xlx_apatb_param_w_conv1) {
    for (int j = 0  - 0, e = 12800 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_w_conv1)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_b_conv1 = 13216*4;
  if (__xlx_apatb_param_b_conv1) {
    for (int j = 0  - 0, e = 32 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_b_conv1)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_w_fc0 = 13248*4;
  if (__xlx_apatb_param_w_fc0) {
    for (int j = 0  - 0, e = 65536 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_w_fc0)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_b_fc0 = 78784*4;
  if (__xlx_apatb_param_b_fc0) {
    for (int j = 0  - 0, e = 128 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_b_fc0)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_w_fc1 = 78912*4;
  if (__xlx_apatb_param_w_fc1) {
    for (int j = 0  - 0, e = 1280 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_w_fc1)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_b_fc1 = 80192*4;
  if (__xlx_apatb_param_b_fc1) {
    for (int j = 0  - 0, e = 10 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_b_fc1)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_feature_in = 80202*4;
  if (__xlx_apatb_param_feature_in) {
    for (int j = 0  - 0, e = 784 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_feature_in)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_feature_out = 80986*4;
  if (__xlx_apatb_param_feature_out) {
    for (int j = 0  - 0, e = 10 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_feature_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_result = 80996*4;
  if (__xlx_apatb_param_result) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_result)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(80997, &tcl_file.gmem_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
