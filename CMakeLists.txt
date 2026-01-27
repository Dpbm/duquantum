cmake_minimum_required(VERSION 3.31 FATAL_ERROR)

set(CMAKE_CXX_COMPILER clang++)
set(CMAKE_CUDA_COMPILER nvcc)

set(CMAKE_PROJECT_SPDX_LICENSE "Apache-2.0")

project(duquantum VERSION 0.0.1 LANGUAGES CUDA DESCRIPTION "A high performance quantum simulation SDK for older GPUs" HOMEPAGE_URL "https://github.com/Dpbm/duquantum")

add_library(statevec SHARED statevec.cu)
add_compile_options(-std=c++20)

