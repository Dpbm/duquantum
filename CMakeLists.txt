cmake_minimum_required(VERSION 3.31 FATAL_ERROR)

project(duquantum 
	VERSION 0.0.1 
	LANGUAGES C CXX CUDA 
	DESCRIPTION "A high performance quantum simulation SDK for older GPUs" 
	HOMEPAGE_URL "https://github.com/Dpbm/duquantum")

set(CMAKE_PROJECT_SPDX_LICENSE "Apache-2.0")
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if (NOT DEFINED CMAKE_BUILD_TYPE)
	message(WARNING "No build type provided, default to RELEASE.")
	set(CMAKE_BUILD_TYPE "Release")
endif ()

add_library(statevec SHARED statevec.cu)

option(BUILD_TESTING "Build the tests" ON)
if(BUILD_TESTING)
	if(NOT DEFINED CUQUANTUM_INCLUDE_DIRS)
		message(FATAL_ERROR "You must provide the CUQUANTUM_INCLUDE_DIRS parameter for build tests!")
	endif()
	if(NOT DEFINED CUQUANTUM_LIB_DIRS)
		message(FATAL_ERROR "You must provide the CUQUANTUM_LIB_DIRS parameter for build tests!")
	endif()
	if(NOT DEFINED CUDA_INCLUDE_DIRS)
		message(FATAL_ERROR "You must provide the CUDA_INCLUDE_DIRS parameter for build Tests!")
	endif()

	message("Build TESTS...")
	add_subdirectory(tests)
endif()

