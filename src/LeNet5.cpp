#include "LeNet5.h"

void lenet5(Dtype_w w_conv0[KH_CONV_0*KW_CONV_0*CHIN_CONV_0*CHOUT_CONV_0],
			Dtype_w b_conv0[CHOUT_CONV_0],
			Dtype_w w_conv1[KH_CONV_1*KW_CONV_1*CHIN_CONV_1*CHOUT_CONV_1],
			Dtype_w b_conv1[CHOUT_CONV_1],
			Dtype_w w_fc0[HIN_FC_0*WIN_FC_0*CHIN_FC_0*CHOUT_FC_0],
			Dtype_w b_fc0[CHOUT_FC_0],
			Dtype_w w_fc1[CHIN_FC_1*CHOUT_FC_1],
			Dtype_w b_fc1[CHOUT_FC_1],
			Dtype_f feature_in[HIN_CONV_0*WIN_CONV_0*CHIN_CONV_0],
			Dtype_f feature_out[CHOUT_FC_1],
			int result[1])
{
#pragma HLS INTERFACE m_axi port=w_conv0 offset=slave depth=12800
#pragma HLS INTERFACE m_axi port=b_conv0 offset=slave depth=512
#pragma HLS INTERFACE m_axi port=w_conv1 offset=slave depth=409600
#pragma HLS INTERFACE m_axi port=b_conv1 offset=slave depth=1024
#pragma HLS INTERFACE m_axi port=w_fc0 offset=slave depth=524288
#pragma HLS INTERFACE m_axi port=b_fc0 offset=slave depth=1024
#pragma HLS INTERFACE m_axi port=w_fc1 offset=slave depth=10240
#pragma HLS INTERFACE m_axi port=b_fc1 offset=slave depth=80
#pragma HLS INTERFACE m_axi port=feature_in offset=slave depth=25088
#pragma HLS INTERFACE m_axi port=feature_out offset=slave depth=16384
#pragma HLS INTERFACE m_axi port=result offset=slave depth=32
#pragma HLS INTERFACE s_axilite port=return


	Dtype_f feature_out_conv0[HOUT_CONV_0*WOUT_CONV_0*CHOUT_CONV_0];
	Dtype_f feature_out_pool0[HOUT_POOL_0*WOUT_POOL_0*CHOUT_POOL_0];
	Dtype_f feature_out_conv1[HOUT_CONV_1*WOUT_CONV_1*CHOUT_CONV_1];
	Dtype_f feature_out_pool1[HOUT_POOL_1*WOUT_POOL_1*CHOUT_POOL_1];
	Dtype_f feature_out_fc0	 [CHOUT_FC_0];
	Dtype_f feature_out_fc1  [CHOUT_FC_1];

	conv_layer0(feature_in, w_conv0, b_conv0, feature_out_conv0);

	pool_layer0(feature_out_conv0, feature_out_pool0);

	conv_layer1(feature_out_pool0, w_conv1, b_conv1, feature_out_conv1);

	pool_layer1(feature_out_conv1, feature_out_pool1);

	linear_fc0(feature_out_pool1, w_fc0, b_fc0, feature_out_fc0);

	linear_fc1(feature_out_fc0, w_fc1, b_fc1, feature_out);

	fmax(feature_out, result);
}
