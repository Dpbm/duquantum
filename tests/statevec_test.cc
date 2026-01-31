#include <gtest/gtest.h>
#include <custatevec.h> 

TEST(Statevec, StatevecAbs2SumArrayReturningValues){
	
	custatevecHandle_t handle;
	double sv[] = {0.0, 1.0, 0.0, 0.0};
	double r[2] = {0};

	EXPECT_EQ(
			custatevecAbs2SumArray(handle, sv, CUDA_R_64F, 1, r, {0}, 1, nullptr, {0}, 1), 
			custatevecStatus_t::CUSTATEVEC_STATUS_INVALID_VALUE
			);
}
