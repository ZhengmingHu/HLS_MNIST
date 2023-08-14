#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" void lenet5(int*, int, int, int, int, int, int, int, int, int, int, int);
extern "C" void apatb_lenet5_hw(volatile void * __xlx_apatb_param_w_conv0, volatile void * __xlx_apatb_param_b_conv0, volatile void * __xlx_apatb_param_w_conv1, volatile void * __xlx_apatb_param_b_conv1, volatile void * __xlx_apatb_param_w_fc0, volatile void * __xlx_apatb_param_b_fc0, volatile void * __xlx_apatb_param_w_fc1, volatile void * __xlx_apatb_param_b_fc1, volatile void * __xlx_apatb_param_feature_in, volatile void * __xlx_apatb_param_feature_out, volatile void * __xlx_apatb_param_result) {
  // Collect __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec
  vector<sc_bv<32> >__xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec;
  for (int j = 0, e = 400; j != e; ++j) {
    __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec.push_back(((int*)__xlx_apatb_param_w_conv0)[j]);
  }
  int __xlx_size_param_w_conv0 = 400;
  int __xlx_offset_param_w_conv0 = 0;
  int __xlx_offset_byte_param_w_conv0 = 0*4;
  for (int j = 0, e = 16; j != e; ++j) {
    __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec.push_back(((int*)__xlx_apatb_param_b_conv0)[j]);
  }
  int __xlx_size_param_b_conv0 = 16;
  int __xlx_offset_param_b_conv0 = 400;
  int __xlx_offset_byte_param_b_conv0 = 400*4;
  for (int j = 0, e = 12800; j != e; ++j) {
    __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec.push_back(((int*)__xlx_apatb_param_w_conv1)[j]);
  }
  int __xlx_size_param_w_conv1 = 12800;
  int __xlx_offset_param_w_conv1 = 416;
  int __xlx_offset_byte_param_w_conv1 = 416*4;
  for (int j = 0, e = 32; j != e; ++j) {
    __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec.push_back(((int*)__xlx_apatb_param_b_conv1)[j]);
  }
  int __xlx_size_param_b_conv1 = 32;
  int __xlx_offset_param_b_conv1 = 13216;
  int __xlx_offset_byte_param_b_conv1 = 13216*4;
  for (int j = 0, e = 65536; j != e; ++j) {
    __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec.push_back(((int*)__xlx_apatb_param_w_fc0)[j]);
  }
  int __xlx_size_param_w_fc0 = 65536;
  int __xlx_offset_param_w_fc0 = 13248;
  int __xlx_offset_byte_param_w_fc0 = 13248*4;
  for (int j = 0, e = 128; j != e; ++j) {
    __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec.push_back(((int*)__xlx_apatb_param_b_fc0)[j]);
  }
  int __xlx_size_param_b_fc0 = 128;
  int __xlx_offset_param_b_fc0 = 78784;
  int __xlx_offset_byte_param_b_fc0 = 78784*4;
  for (int j = 0, e = 1280; j != e; ++j) {
    __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec.push_back(((int*)__xlx_apatb_param_w_fc1)[j]);
  }
  int __xlx_size_param_w_fc1 = 1280;
  int __xlx_offset_param_w_fc1 = 78912;
  int __xlx_offset_byte_param_w_fc1 = 78912*4;
  for (int j = 0, e = 10; j != e; ++j) {
    __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec.push_back(((int*)__xlx_apatb_param_b_fc1)[j]);
  }
  int __xlx_size_param_b_fc1 = 10;
  int __xlx_offset_param_b_fc1 = 80192;
  int __xlx_offset_byte_param_b_fc1 = 80192*4;
  for (int j = 0, e = 784; j != e; ++j) {
    __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec.push_back(((int*)__xlx_apatb_param_feature_in)[j]);
  }
  int __xlx_size_param_feature_in = 784;
  int __xlx_offset_param_feature_in = 80202;
  int __xlx_offset_byte_param_feature_in = 80202*4;
  for (int j = 0, e = 10; j != e; ++j) {
    __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec.push_back(((int*)__xlx_apatb_param_feature_out)[j]);
  }
  int __xlx_size_param_feature_out = 10;
  int __xlx_offset_param_feature_out = 80986;
  int __xlx_offset_byte_param_feature_out = 80986*4;
  for (int j = 0, e = 1; j != e; ++j) {
    __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec.push_back(((int*)__xlx_apatb_param_result)[j]);
  }
  int __xlx_size_param_result = 1;
  int __xlx_offset_param_result = 80996;
  int __xlx_offset_byte_param_result = 80996*4;
  int* __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__input_buffer= new int[__xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec.size()];
  for (int i = 0; i < __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec.size(); ++i) {
    __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__input_buffer[i] = __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  lenet5(__xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__input_buffer, __xlx_offset_byte_param_w_conv0, __xlx_offset_byte_param_b_conv0, __xlx_offset_byte_param_w_conv1, __xlx_offset_byte_param_b_conv1, __xlx_offset_byte_param_w_fc0, __xlx_offset_byte_param_b_fc0, __xlx_offset_byte_param_w_fc1, __xlx_offset_byte_param_b_fc1, __xlx_offset_byte_param_feature_in, __xlx_offset_byte_param_feature_out, __xlx_offset_byte_param_result);
// print __xlx_apatb_param_w_conv0
  sc_bv<32>*__xlx_w_conv0_output_buffer = new sc_bv<32>[__xlx_size_param_w_conv0];
  for (int i = 0; i < __xlx_size_param_w_conv0; ++i) {
    __xlx_w_conv0_output_buffer[i] = __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__input_buffer[i+__xlx_offset_param_w_conv0];
  }
  for (int i = 0; i < __xlx_size_param_w_conv0; ++i) {
    ((int*)__xlx_apatb_param_w_conv0)[i] = __xlx_w_conv0_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_b_conv0
  sc_bv<32>*__xlx_b_conv0_output_buffer = new sc_bv<32>[__xlx_size_param_b_conv0];
  for (int i = 0; i < __xlx_size_param_b_conv0; ++i) {
    __xlx_b_conv0_output_buffer[i] = __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__input_buffer[i+__xlx_offset_param_b_conv0];
  }
  for (int i = 0; i < __xlx_size_param_b_conv0; ++i) {
    ((int*)__xlx_apatb_param_b_conv0)[i] = __xlx_b_conv0_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_w_conv1
  sc_bv<32>*__xlx_w_conv1_output_buffer = new sc_bv<32>[__xlx_size_param_w_conv1];
  for (int i = 0; i < __xlx_size_param_w_conv1; ++i) {
    __xlx_w_conv1_output_buffer[i] = __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__input_buffer[i+__xlx_offset_param_w_conv1];
  }
  for (int i = 0; i < __xlx_size_param_w_conv1; ++i) {
    ((int*)__xlx_apatb_param_w_conv1)[i] = __xlx_w_conv1_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_b_conv1
  sc_bv<32>*__xlx_b_conv1_output_buffer = new sc_bv<32>[__xlx_size_param_b_conv1];
  for (int i = 0; i < __xlx_size_param_b_conv1; ++i) {
    __xlx_b_conv1_output_buffer[i] = __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__input_buffer[i+__xlx_offset_param_b_conv1];
  }
  for (int i = 0; i < __xlx_size_param_b_conv1; ++i) {
    ((int*)__xlx_apatb_param_b_conv1)[i] = __xlx_b_conv1_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_w_fc0
  sc_bv<32>*__xlx_w_fc0_output_buffer = new sc_bv<32>[__xlx_size_param_w_fc0];
  for (int i = 0; i < __xlx_size_param_w_fc0; ++i) {
    __xlx_w_fc0_output_buffer[i] = __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__input_buffer[i+__xlx_offset_param_w_fc0];
  }
  for (int i = 0; i < __xlx_size_param_w_fc0; ++i) {
    ((int*)__xlx_apatb_param_w_fc0)[i] = __xlx_w_fc0_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_b_fc0
  sc_bv<32>*__xlx_b_fc0_output_buffer = new sc_bv<32>[__xlx_size_param_b_fc0];
  for (int i = 0; i < __xlx_size_param_b_fc0; ++i) {
    __xlx_b_fc0_output_buffer[i] = __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__input_buffer[i+__xlx_offset_param_b_fc0];
  }
  for (int i = 0; i < __xlx_size_param_b_fc0; ++i) {
    ((int*)__xlx_apatb_param_b_fc0)[i] = __xlx_b_fc0_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_w_fc1
  sc_bv<32>*__xlx_w_fc1_output_buffer = new sc_bv<32>[__xlx_size_param_w_fc1];
  for (int i = 0; i < __xlx_size_param_w_fc1; ++i) {
    __xlx_w_fc1_output_buffer[i] = __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__input_buffer[i+__xlx_offset_param_w_fc1];
  }
  for (int i = 0; i < __xlx_size_param_w_fc1; ++i) {
    ((int*)__xlx_apatb_param_w_fc1)[i] = __xlx_w_fc1_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_b_fc1
  sc_bv<32>*__xlx_b_fc1_output_buffer = new sc_bv<32>[__xlx_size_param_b_fc1];
  for (int i = 0; i < __xlx_size_param_b_fc1; ++i) {
    __xlx_b_fc1_output_buffer[i] = __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__input_buffer[i+__xlx_offset_param_b_fc1];
  }
  for (int i = 0; i < __xlx_size_param_b_fc1; ++i) {
    ((int*)__xlx_apatb_param_b_fc1)[i] = __xlx_b_fc1_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_feature_in
  sc_bv<32>*__xlx_feature_in_output_buffer = new sc_bv<32>[__xlx_size_param_feature_in];
  for (int i = 0; i < __xlx_size_param_feature_in; ++i) {
    __xlx_feature_in_output_buffer[i] = __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__input_buffer[i+__xlx_offset_param_feature_in];
  }
  for (int i = 0; i < __xlx_size_param_feature_in; ++i) {
    ((int*)__xlx_apatb_param_feature_in)[i] = __xlx_feature_in_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_feature_out
  sc_bv<32>*__xlx_feature_out_output_buffer = new sc_bv<32>[__xlx_size_param_feature_out];
  for (int i = 0; i < __xlx_size_param_feature_out; ++i) {
    __xlx_feature_out_output_buffer[i] = __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__input_buffer[i+__xlx_offset_param_feature_out];
  }
  for (int i = 0; i < __xlx_size_param_feature_out; ++i) {
    ((int*)__xlx_apatb_param_feature_out)[i] = __xlx_feature_out_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_result
  sc_bv<32>*__xlx_result_output_buffer = new sc_bv<32>[__xlx_size_param_result];
  for (int i = 0; i < __xlx_size_param_result; ++i) {
    __xlx_result_output_buffer[i] = __xlx_w_conv0_b_conv0_w_conv1_b_conv1_w_fc0_b_fc0_w_fc1_b_fc1_feature_in_feature_out_result__input_buffer[i+__xlx_offset_param_result];
  }
  for (int i = 0; i < __xlx_size_param_result; ++i) {
    ((int*)__xlx_apatb_param_result)[i] = __xlx_result_output_buffer[i].to_uint64();
  }
}
