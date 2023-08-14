#include <ap_int.h>
#include <iostream>

using namespace std;

#define max(a,b) ((a>b)?a:b)

#define CHIN_CONV_0		1
#define CHOUT_CONV_0	16
#define HIN_CONV_0 		28
#define WIN_CONV_0 	  	28
#define HOUT_CONV_0    	24
#define WOUT_CONV_0	  	24
#define KH_CONV_0 		5
#define KW_CONV_0  		5
#define CHIN_POOL_0		16
#define CHOUT_POOL_0	16
#define HIN_POOL_0 		24
#define WIN_POOL_0 	  	24
#define HOUT_POOL_0    	12
#define WOUT_POOL_0  	12
#define KH_POOL_0 		2
#define KW_POOL_0  		2

#define CHIN_CONV_1		16
#define CHOUT_CONV_1	32
#define HIN_CONV_1 		12
#define WIN_CONV_1 	  	12
#define HOUT_CONV_1    	8
#define WOUT_CONV_1	  	8
#define KH_CONV_1 		5
#define KW_CONV_1  		5
#define CHIN_POOL_1		32
#define CHOUT_POOL_1	32
#define HIN_POOL_1 		8
#define WIN_POOL_1 	  	8
#define HOUT_POOL_1    	4
#define WOUT_POOL_1  	4
#define KH_POOL_1 		2
#define KW_POOL_1  		2

#define CHIN_FC_0		32
#define CHOUT_FC_0		128
#define HIN_FC_0		4
#define	WIN_FC_0		4
#define WOUT_FC_0		1
#define HOUT_FC_0		1

#define CHIN_FC_1	 	128
#define CHOUT_FC_1		10

#define CHIN_SM			10

typedef float Dtype_f;
typedef float Dtype_w;
typedef float Dtype_mul;
typedef float Dtype_acc;


void 	lenet5     (Dtype_w w_conv0[KH_CONV_0*KW_CONV_0*CHIN_CONV_0*CHOUT_CONV_0],
					Dtype_w b_conv0[CHOUT_CONV_0],
					Dtype_w w_conv1[KH_CONV_1*KW_CONV_1*CHIN_CONV_1*CHOUT_CONV_1],
					Dtype_w b_conv1[CHOUT_CONV_1],
					Dtype_w w_fc0[HIN_FC_0*WIN_FC_0*CHIN_FC_0*CHOUT_FC_0],
					Dtype_w b_fc0[CHOUT_FC_0],
					Dtype_w w_fc1[CHIN_FC_1*CHOUT_FC_1],
					Dtype_w b_fc1[CHOUT_FC_1],
					Dtype_f feature_in[HIN_CONV_0*WIN_CONV_0*CHIN_CONV_0],
					Dtype_f feature_out[HOUT_CONV_0*WOUT_CONV_0*CHOUT_CONV_0],
					int result[1]);

void 	conv_layer0(Dtype_f feature_in[HIN_CONV_0*WIN_CONV_0*CHIN_CONV_0],
					Dtype_w w[KH_CONV_0*KW_CONV_0*CHIN_CONV_0*CHOUT_CONV_0],
					Dtype_w b[CHOUT_CONV_0],
					Dtype_f feature_out[HOUT_CONV_0*WOUT_CONV_0*CHOUT_CONV_0]);

void 	pool_layer0(Dtype_f feature_in[HIN_POOL_0*WIN_POOL_0*CHIN_POOL_0],
					Dtype_f feature_out[HOUT_POOL_0*WOUT_POOL_0*CHOUT_POOL_0]);

void	conv_layer1(Dtype_f feature_in[HIN_CONV_1*WIN_CONV_1*CHIN_CONV_1],
					Dtype_w w[KH_CONV_1*KW_CONV_1*CHIN_CONV_1*CHOUT_CONV_1],
					Dtype_w b[CHOUT_CONV_1],
					Dtype_f feature_out[HOUT_CONV_1*WOUT_CONV_1*CHOUT_CONV_1]);

void    pool_layer1(Dtype_f feature_in[HIN_POOL_1*WIN_POOL_1*CHIN_POOL_1],
				    Dtype_f feature_out[HOUT_POOL_1*WOUT_POOL_1*CHOUT_POOL_1]);

void 	linear_fc0 (Dtype_f feature_in[HIN_FC_0*WIN_FC_0*CHIN_FC_0],
					Dtype_w w[HIN_FC_0*WIN_FC_0*CHIN_FC_0*CHOUT_FC_0],
					Dtype_w b[CHOUT_FC_0],
					Dtype_f feature_out[HOUT_FC_0*WOUT_FC_0*CHOUT_FC_0]);

void 	linear_fc1 (Dtype_f feature_in[CHIN_FC_1],
					Dtype_w w[CHIN_FC_1*CHOUT_FC_1],
					Dtype_w b[CHOUT_FC_1],
					Dtype_f feature_out[CHOUT_FC_1]);

void 	fmax	   (Dtype_f feature_in[CHIN_SM],
		  	  	  	int result[1]);

