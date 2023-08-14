#include "LeNet5.h"

#define CHin_L0  	CHIN_CONV_0
#define Hin_L0  	HIN_CONV_0
#define Win_L0   	WIN_CONV_0
#define Hout_L0  	HOUT_CONV_0
#define Wout_L0  	WOUT_CONV_0
#define KH_L0	  	KH_CONV_0
#define KW_L0    	KW_CONV_0
#define CHout_L0 	CHOUT_CONV_0

#define CHin_L1		CHIN_CONV_1
#define Hin_L1		HIN_CONV_1
#define Win_L1		WIN_CONV_1
#define Hout_L1		HOUT_CONV_1
#define Wout_L1		WOUT_CONV_1
#define KH_L1		KH_CONV_1
#define KW_L1		KW_CONV_1
#define CHout_L1	CHOUT_CONV_1



void conv_layer0(Dtype_f feature_in[Hin_L0*Win_L0*CHin_L0],
		  	  	 Dtype_w W[KH_L0*KW_L0*CHin_L0*CHout_L0],
				 Dtype_w b[CHout_L0],
				 Dtype_f feature_out[Hout_L0*Wout_L0*CHout_L0])
{
	Dtype_mul  temp;
	Dtype_acc  sum;


	for(int cout=0; cout<CHout_L0; cout++)
		for(int hout=0; hout<Hout_L0; hout++)
			for(int wout=0; wout<Wout_L0; wout++)
			{
				sum = 0;
				for(int kh=0; kh<KH_L0; kh++)
					for(int kw=0; kw<KW_L0; kw++)
					{
						ap_uint<16> h = hout + kh;
						ap_uint<16> w = wout + kw;
						for(int cin=0; cin<CHin_L0; cin++)
						{
							temp = feature_in[h*Win_L0*CHin_L0+w*CHin_L0+cin]
								   *W[kh*KW_L0*CHin_L0*CHout_L0+kw*CHin_L0*CHout_L0+cin*CHout_L0+cout];
							sum += temp;
						}
					}
				sum += b[cout];
				if(sum < 0)
				{
					sum = 0;
				}
				feature_out[hout*Wout_L0*CHout_L0+wout*CHout_L0+cout] = sum;

			}
}

void conv_layer1(Dtype_f feature_in[Hin_L1*Win_L1*CHin_L1],
		  	  	 Dtype_w W[KH_L1*KW_L1*CHin_L1*CHout_L1],
				 Dtype_w b[CHout_L1],
				 Dtype_f feature_out[Hout_L1*Wout_L1*CHout_L1])
{
	Dtype_mul  temp;
	Dtype_acc  sum;


	for(int cout=0; cout<CHout_L1; cout++)
		for(int hout=0; hout<Hout_L1; hout++)
			for(int wout=0; wout<Wout_L1; wout++)
			{
				sum = 0;
				for(int kh=0; kh<KH_L1; kh++)
					for(int kw=0; kw<KW_L1; kw++)
					{
						ap_uint<16> h = hout + kh;
						ap_uint<16> w = wout + kw;
						for(int cin=0; cin<CHin_L1; cin++)
						{
							temp = feature_in[h*Win_L1*CHin_L1+w*CHin_L1+cin]
								   *W[kh*KW_L1*CHin_L1*CHout_L1+kw*CHin_L1*CHout_L1+cin*CHout_L1+cout];
							sum += temp;
						}
					}
				sum += b[cout];
				if(sum < 0)
				{
					sum = 0;
				}
				feature_out[hout*Wout_L1*CHout_L1+wout*CHout_L1+cout] = sum;

			}
}
