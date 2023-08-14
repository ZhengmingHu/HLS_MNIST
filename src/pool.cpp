#include "LeNet5.h"

#define CHin_L0		CHIN_POOL_0
#define Hin_L0 		HIN_POOL_0
#define Win_L0 		WIN_POOL_0
#define Hout_L0 	HOUT_POOL_0
#define Wout_L0 	WOUT_POOL_0
#define KH_L0 		KH_POOL_0
#define KW_L0 		KW_POOL_0
#define CHout_L0    CHOUT_POOL_0

#define CHin_L1		CHIN_POOL_1
#define Hin_L1		HIN_POOL_1
#define Win_L1 		WIN_POOL_1
#define Hout_L1 	HOUT_POOL_1
#define Wout_L1 	WOUT_POOL_1
#define KH_L1 		KH_POOL_1
#define KW_L1 		KW_POOL_1
#define CHout_L1    CHOUT_POOL_1


void pool_layer0(Dtype_f feature_in[Hin_L0*Win_L0*CHin_L0], Dtype_f feature_out[Hout_L0*Wout_L0*CHout_L0])
{

	for(int cin=0; cin<CHin_L0; cin++)
		for(int hout=0; hout<Hout_L0; hout++)
			for(int wout=0; wout<Wout_L0; wout++)
			{
				Dtype_acc sum = -9999999;
				for(int kh=0; kh<KH_L0; kh++)
					for(int kw=0; kw<KW_L0; kw++)

					{
						ap_uint<16> h = hout*KH_L0 + kh;
						ap_uint<16> w = wout*KW_L0 + kw;
 						sum = max(sum, feature_in[h*Win_L0*CHin_L0+w*CHin_L0+cin]);
					}
				ap_uint<16> cout = cin;
				feature_out[hout*Wout_L0*CHout_L0+wout*CHout_L0+cout]=sum;
			}

}

void pool_layer1(Dtype_f feature_in[Hin_L1*Win_L1*CHin_L1], Dtype_f feature_out[Hout_L1*Wout_L1*CHout_L1])
{

	for(int cin=0; cin<CHin_L1; cin++)
		for(int hout=0; hout<Hout_L1; hout++)
			for(int wout=0; wout<Wout_L1; wout++)
			{
				Dtype_acc sum = -9999999;
				for(int kh=0; kh<KH_L1; kh++)
					for(int kw=0; kw<KW_L1; kw++)

					{
						ap_uint<16> h = hout*KH_L1 + kh;
						ap_uint<16> w = wout*KW_L1 + kw;
 						sum = max(sum, feature_in[h*Win_L1*CHin_L1+w*CHin_L1+cin]);
					}
				ap_uint<16> cout = cin;
				feature_out[hout*Wout_L1*CHout_L1+wout*CHout_L1+cout]=sum;
			}

}
