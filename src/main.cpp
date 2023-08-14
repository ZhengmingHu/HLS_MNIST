#include "LeNet5.h"

using namespace std;

#define CHANNEL_IN0    		1
#define CHANNEL_OUT0   		16
#define HEIGHT_IN_CONV0 	28
#define WIDTH_IN_CONV0 	  	28
#define HEIGHT_OUT_CONV0    24
#define WIDTH_OUT_CONV0	  	24
#define HEIGHT_KERNEL_CONV0 5
#define WIDTH_KERNEL_CONV0  5
#define HEIGHT_IN_POOL0 	24
#define WIDTH_IN_POOL0 	  	24
#define HEIGHT_OUT_POOL0    12
#define WIDTH_OUT_POOL0	  	12
#define HEIGHT_KERNEL_POOL0 2
#define WIDTH_KERNEL_POOL0  2

#define CHANNEL_IN1    		16
#define CHANNEL_OUT1   		32
#define HEIGHT_IN_CONV1 	12
#define WIDTH_IN_CONV1 	  	12
#define HEIGHT_OUT_CONV1    8
#define WIDTH_OUT_CONV1	  	8
#define HEIGHT_KERNEL_CONV1 5
#define WIDTH_KERNEL_CONV1  5
#define HEIGHT_IN_POOL1 	8
#define WIDTH_IN_POOL1 	  	8
#define HEIGHT_OUT_POOL1    4
#define WIDTH_OUT_POOL1	  	4
#define HEIGHT_KERNEL_POOL1 2
#define WIDTH_KERNEL_POOL1  2

#define CHANNEL_FC_IN0	    32
#define CHANNEL_FC_OUT0		128
#define HEIGHT_IN_FC0 		4
#define WIDTH_IN_FC0 	  	4
#define HEIGHT_OUT_FC0    	1
#define WIDTH_OUT_FC0	  	1

#define CHANNEL_FC_IN1		128
#define CHANNEL_FC_OUT1		10

#define CHANNEL_SM_IN		10

int main(void)
{
	Dtype_f feature_in_layer0_conv[HEIGHT_IN_CONV0][WIDTH_IN_CONV0][CHANNEL_IN0];
	Dtype_f feature_out_layer0_conv[HEIGHT_OUT_CONV0][WIDTH_OUT_CONV0][CHANNEL_OUT0];
	Dtype_f feature_out_layer0_pool[HEIGHT_OUT_POOL0][WIDTH_OUT_POOL0][CHANNEL_OUT0];
	Dtype_f feature_out_layer0[HEIGHT_OUT_POOL0][WIDTH_OUT_POOL0][CHANNEL_OUT0];
	Dtype_w w_layer0[HEIGHT_KERNEL_CONV0][WIDTH_KERNEL_CONV0][CHANNEL_IN0][CHANNEL_OUT0];
	Dtype_w bias_layer0[CHANNEL_OUT0];

	Dtype_w w_layer1[HEIGHT_KERNEL_CONV1][WIDTH_KERNEL_CONV1][CHANNEL_IN1][CHANNEL_OUT1];
	Dtype_w bias_layer1[CHANNEL_OUT1];
	Dtype_f feature_out_layer1[HEIGHT_OUT_POOL1][WIDTH_OUT_POOL1][CHANNEL_OUT1];

	Dtype_w w_fc0[HEIGHT_IN_FC0][WIDTH_IN_FC0][CHANNEL_FC_IN0][CHANNEL_FC_OUT0];
	Dtype_w bias_fc0[CHANNEL_FC_OUT0];
	Dtype_f feature_out_fc0[CHANNEL_FC_OUT0];

	Dtype_w w_fc1[CHANNEL_FC_IN1][CHANNEL_FC_OUT1];
	Dtype_w bias_fc1[CHANNEL_FC_OUT1];
	Dtype_f feature_out_fc1[CHANNEL_FC_OUT1];

	int result[1];

	for(int hin=0; hin<HEIGHT_IN_CONV0; hin++)
		for(int win=0; win<WIDTH_IN_CONV0; win++)
			for(int cin=0; cin<CHANNEL_IN0; cin++)
			{
				feature_in_layer0_conv[hin][win][cin] = win + cin;
			}


	for(int kh=0; kh<HEIGHT_KERNEL_CONV0; kh++)
		for(int kw=0; kw<WIDTH_KERNEL_CONV0; kw++)
			for(int cin=0; cin<CHANNEL_IN0; cin++)
				for(int cout=0; cout<CHANNEL_OUT0; cout++)
				{
					w_layer0[kh][kw][cin][cout] = 0.1;
				}

	for(int kh=0; kh<HEIGHT_KERNEL_CONV1; kh++)
		for(int kw=0; kw<WIDTH_KERNEL_CONV1; kw++)
			for(int cin=0; cin<CHANNEL_IN1; cin++)
				for(int cout=0; cout<CHANNEL_OUT1; cout++)
				{
					w_layer1[kh][kw][cin][cout] = 0.1;
				}

	for(int kh=0; kh<HEIGHT_IN_FC0; kh++)
		for(int kw=0; kw<WIDTH_IN_FC0; kw++)
			for(int cin=0; cin<CHANNEL_FC_IN0; cin++)
				for(int cout=0; cout<CHANNEL_FC_OUT0; cout++)
				{
					w_fc0[kh][kw][cin][cout] = 0.01;
				}
	for(int cin=0; cin<CHANNEL_FC_IN1; cin++)
		for(int cout=0; cout<CHANNEL_FC_OUT1; cout++)
		{
			w_fc1[cin][cout] = 0.01*cin*CHANNEL_FC_OUT1+cout;
		}

	for(int cout=0; cout<CHANNEL_OUT0; cout++)
		bias_layer0[cout] = {0};

	for(int cout=0; cout<CHANNEL_OUT1; cout++)
		bias_layer1[cout] = {0};

	for(int cout=0; cout<CHANNEL_FC_OUT0; cout++)
		bias_fc0[cout] = {0};

	for(int cout=0; cout<CHANNEL_FC_OUT1; cout++)
		bias_fc1[cout] = {0};


	/*printf("\n-------**CONV_LAYER0**-------\n\n");
	conv(CHANNEL_IN, HEIGHT_IN_CONV0, WIDTH_IN_CONV0, CHANNEL_OUT, WIDTH_KERNEL_CONV0,
			HEIGHT_KERNEL_CONV0, RELU_EN, feature_in_layer0_conv[0][0], w[0][0][0], bias, feature_out_layer0_conv[0][0]);


	for(int hout=0; hout<HEIGHT_OUT_CONV0; hout++)
		for(int wout=0; wout<WIDTH_OUT_CONV0; wout++)
			for(int cout=0; cout<CHANNEL_OUT; cout++)
			{
				printf("CONV0_OUT[%d][%d][%d]=%f\n", hout, wout, cout, feature_out_layer0_conv[hout][wout][cout]);

			}
	printf("\n-------**POOL_LAYER0**-------\n\n");
	pool(CHANNEL_IN, HEIGHT_IN_POOL0, WIDTH_IN_POOL0, CHANNEL_OUT, WIDTH_KERNEL_POOL0,
			HEIGHT_KERNEL_POOL0, feature_out_layer0_conv[0][0], feature_out_layer0_pool[0][0]);

	for(int hout=0; hout<HEIGHT_OUT_POOL0; hout++)
			for(int wout=0; wout<WIDTH_OUT_POOL0; wout++)
				for(int cout=0; cout<CHANNEL_OUT; cout++)
				{
					printf("POOL0_OUT[%d][%d][%d]=%f\n", hout, wout, cout, feature_out_layer0_pool[hout][wout][cout]);
				}

	printf("\n---------**LAYER0**---------\n\n");
	printf("\n-----**LAYER0+LAYER1**------\n\n");
	lenet5(RELU_EN0, RELU_EN0,
		   w_layer0[0][0][0], bias_layer0,
		   w_layer1[0][0][0], bias_layer1,
		   w_fc0[0][0][0], bias_fc0,
		   feature_in_layer0_conv[0][0],
		   feature_out_fc0[0][0]);

	for(int hout=0; hout<HEIGHT_OUT_POOL1; hout++)
			for(int wout=0; wout<WIDTH_OUT_POOL1; wout++)
						for(int cout=0; cout<CHANNEL_OUT1; cout++)
						{
							printf("POOL0_OUT[%d][%d][%d]=%f\n", hout, wout, cout,
									feature_out_layer1[hout][wout][cout]);
						}*/

	printf("\n---**LAYER0+LAYER1+FC0**---\n\n");
	lenet5(w_layer0[0][0][0], bias_layer0,
		   w_layer1[0][0][0], bias_layer1,
		   w_fc0[0][0][0], bias_fc0,
		   w_fc1[0], bias_fc1,
		   feature_in_layer0_conv[0][0],
		   feature_out_fc1,
		   result);
		   for(int cout=0; cout<CHANNEL_FC_OUT1; cout++)
		   {
				printf("FC1_OUT[%d]=%f\n", cout,
				feature_out_fc1[cout]);
	   	   }
		   printf("result:%d\n", result[0]);

	return 0;

}
