#include "LeNet5.h"

#define CHin_FC0  CHIN_FC_0
#define CHout_FC0 CHOUT_FC_0
#define Hin_FC0	  HIN_FC_0
#define Win_FC0	  WIN_FC_0
#define Hout_FC0  HOUT_FC_0
#define	Wout_FC0  WOUT_FC_0

#define CHin_FC1  CHIN_FC_1
#define CHout_FC1 CHOUT_FC_1

void linear_fc0(Dtype_f feature_in[Hin_FC0*Win_FC0*CHin_FC0],
				Dtype_w W[Hin_FC0*Win_FC0*CHin_FC0*CHout_FC0],
				Dtype_w b[CHout_FC0],
				Dtype_f feature_out[Hout_FC0*Wout_FC0*CHout_FC0])
{
	Dtype_mul  temp;
	Dtype_acc  sum;

	for(int cout=0; cout<CHout_FC0; cout++)
	{
		sum = 0;
		for(int hin=0; hin<Hin_FC0; hin++)
			for(int win=0; win<Win_FC0; win++)
			{
				for(int cin=0; cin<CHin_FC0; cin++)
				{
					temp = feature_in[hin*Win_FC0*CHin_FC0+win*CHin_FC0+cin]
						   *W[hin*Win_FC0*CHin_FC0*CHout_FC0+win*CHin_FC0*CHout_FC0+cin*CHout_FC0+cout];
					sum += temp;
				}
			}
		sum += b[cout];
		if(sum < 0)
		{
			sum = 0;
		}
		feature_out[cout] = sum;
	}
}

void linear_fc1(Dtype_f feature_in[CHin_FC1],
				Dtype_w W[CHin_FC1*CHout_FC1],
				Dtype_w b[CHout_FC1],
				Dtype_f feature_out[CHout_FC1])
{
	Dtype_mul  temp;
	Dtype_acc  sum;

	for(int cout=0; cout<CHout_FC1; cout++)
	{
		sum = 0;
		for(int cin=0; cin<CHin_FC1; cin++)
			{
				temp = feature_in[cin]*W[cin*CHout_FC1+cout];
				sum += temp;
			}

		sum += b[cout];
		feature_out[cout] = sum;
	}
}


