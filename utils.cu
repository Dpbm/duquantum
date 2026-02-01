#include "utils.hpp"

constexpr size_t cuda_type_to_bytes(cudaDataType_t type){
	switch(type){
		case CUDA_R_64F: return sizeof(double);
		default:
		       throw std::invalid_argument(std::format("No implementation for this type {}", type));
	}
}
