#include "LeNet5.h"

#define CHin_SM CHIN_SM

void fmax(Dtype_f feature_in[CHin_SM],
		  int result[1])
{
	Dtype_f max = feature_in[0];
	int index = 0;

	for(int i=1; i<CHin_SM; i++)
	{
		if(feature_in[i] > max)
		{
			max = feature_in[i];
			index = i;
		}
	}

	result[0] = index;
}
