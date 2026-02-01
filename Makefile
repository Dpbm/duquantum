SHELL := /usr/bin/bash

SHARED_LIBRARIES := $(wildcard *.so)
CACHE_FILES := build build.ninja CMakeFiles CMakeCache.txt $(wildcard *.cmake) $(wildcard .ninja_*)

CONAN_CONFIG_FILE := conanfile.txt

BUILD_DIR := build/

CMAKE_COMMON_FLAGS := -G Ninja -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_CUDA_COMPILER=nvcc

all: conan-install build-debug

.PHONY: delete conan-install setup-conan run-tests

delete: 
	@echo "Deleting temp files..."
	rm -rf $(CONAN_OUTPUT_DIR) $(SHARED_LIBRARIES) $(CACHE_FILES)


setup-conan:
	@echo "------------------------------------"
	@echo "Setup conan profile..."
	conan profile detect --force

conan-install: $(CONAN_CONFIG_FILE)
	@echo "------------------------------------"
	@echo "Creating folder $(BUILD_DIR) if it doesn't exists..."
	if [[ ! -d $(BUILD_DIR) ]]; then mkdir -p $(BUILD_DIR); fi
	@echo "Installing dependencies with conan..."
	conan install . --output-folder=$(BUILD_DIR) --build=missing -s build_type=$${BUILD_TYPE:-Debug}

build-debug:
	@echo "------------------------------------"
	@echo "Building project in Debug mode..."
	cmake -B build -S . $(CMAKE_COMMON_FLAGS) -DCUDA_INCLUDE_DIRS=$(CUDA_INCLUDE_DIRS) -DCUQUANTUM_INCLUDE_DIRS=$(CUQUANTUM_INCLUDE_DIRS) -DCUQUANTUM_LIB_DIRS=$(CUQUANTUM_LIB_DIRS) -DCMAKE_BUILD_TYPE=Debug
	cmake --build $(BUILD_DIR)

run-tests: $(BUILD_DIR)
	@echo "------------------------------------"
	@echo "Run tests..."
	cd $(BUILD_DIR)tests && echo "Current dir: $(shell pwd)" && ctest --output-on-failure

