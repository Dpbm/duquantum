#include <cuda_runtime_api.h>
#include <cublas_v2.h>

#include "statevec.hpp"
#include "utils.hpp"

using ArrayLen = uint32_t;

template<typename T>
bool areBitsOverlapping(
		const T* arrA, 
		const T* arrB,
		const ArrayLen arrALen,
		const ArrayLen arrBLen
	){
	
	if(arrALen == 0 || arrBLen == 0 || arrA == nullptr || arrB == nullptr) return false;

	for(ArrayLen i = 0; i < arrALen; i++){
		for(ArrayLen j = 0; j < arrBLen; j++){
			if(arrA[i] == arrB[j]) return true;
		}
	}

	return false;
}

Status_t custatevecAbs2SumArray(
		Handle_t handle, 
		const void* sv,
		cudaDataType_t svDataType, //statevector type
		const uint32_t nIndexBits, //
		double* abs2sum,
		const int32_t* bitOrdering,
		const uint32_t bitOrderingLen,
		const int32_t* maskBitString,
		const int32_t* maskOrdering,
		const uint32_t maskLen
		){

	// If the \p maskLen argument is 0, null pointers can be specified to the \p maskBitString and \p maskOrdering arguments, and all state vector elements are used for calculation.
	constexpr bool invalidMask = maskLen != 0 && (maskBitString == nullptr || maskOrdering == nullptr);

	// By definition, bit positions in \p bitOrdering and \p maskOrdering arguments should not overlap.
	bool bitsOverlap = areBitsOverlapping<int32_t>(bitOrdering, maskOrdering, bitOrderingLen, maskLen);

	// The empty \p bitOrdering can be specified to calculate the norm of state vector. In this case, 0 is passed to the \p bitOrderingLen argument and the \p bitOrdering argument can be a null pointer.
	constexpr bool invalidBitOrdering = bitOrderingLen != 0 && bitOrdering == nullptr;
	
	// Since the size of abs2sum array is proportional to \f$ 2^{bitOrderingLen} \f$ , the max length of \p bitOrdering depends on the amount of available memory and \p maskLen.
	// when shifting for a big number, the uint32_t may overflow and present a undefined behavior. for this case, we gonna use size_t and the verification is done with it. Also, we're going to check if it can overflow and also if the index bits can do the same.
	#if defined(_WIN64) || defined(__x86_64__) || defined(_M_AMD64) || defined(__amd64__)
		// max for size_t in x64 is 2^64-1
		constexpr bool willOverflowBitOrdering = bitOrderingLen-1 >= 64;
		constexpr bool willOverflowSVLen = nIndexBits >= 64;
	#elif defined(__i386__) || defined(_M_IX86)
		// max for size_t in x86 is 2^32-1
		constexpr bool willOverflowBitOrdering = bitOrderingLen-1 >= 32;
		constexpr bool willOverflowSVLen = nIndexBits >= 32;
	#endif
	
	
	bool invalidBitOrderingSize = willOverflowBitOrdering;
	if(!willOverflowBitOrdering){
		constexpr size_t maxLen = 1 << (bitOrderingLen - 1);
		invalidBitOrderingSize = bitOrderingLen > maxLen;
	}

	if(invalidMask || bitsOverlap || invalidBitOrdering || invalidBitOrderingSize || willOverflowSVLen){
		return Status_t::INVALID_VALUE;
	}
	
	constexpr size_t vecLen = 1 << nIndexBits;
	if(bitOrderingLen == 0){
		cublasHandle_t cublas_handle;

		status = cublasCreate(&handle);
		if (status != CUBLAS_STATUS_SUCCESS) {
			return Status_t::CUDA_ERROR;
		}	
		
		constexpr size_t statevecTypeSize = cuda_type_to_bytes(svDataType);

		void* deviceVector;
		cudaError_t cudaStatus = cudaMalloc((void**)&deviceVector, statevec_type_size * vecLen);
		if(cudaStatus != cudaSuccess){
			cublasDestroy(cublas_handle);
			return Status_t::CUDA_ERROR;
		}



		cublasDestroy(cublas_handle);


		


	}


	//if(maskLen == 0){
		// calculate for all bitstrings
	//}





	
	return Status_t::SUCCESS;
}
