#include "statevec.hpp"

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

	bool invalidMask = maskLen != 0 && (maskBitString == nullptr || maskOrdering == nullptr);
	bool bitsOverlap = areBitsOverlapping<int32_t>(bitOrdering, maskOrdering, bitOrderingLen, maskLen);
	if(invalidMask || bitsOverlap){
		return Status_t::INVALID_VALUE;
	}



	
	return Status_t::SUCCESS;
}
