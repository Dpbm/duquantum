SHARED_LIBRARIES := $(wildcard *.so)
CACHE_FILES := build build.ninja CMakeFiles CMakeCache.txt $(wildcard *.cmake) $(wildcard .ninja_*)

CONAN_CONFIG_FILE := conanfile.txt
CONAN_OUTPUT_DIR := conan-out/

CMAKE_COMMON_FLAGS := -G Ninja -DCMAKE_TOOLCHAIN_FILE=$(CONAN_OUTPUT_DIR)/conan_toolchain.cmake -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_CUDA_COMPILER=nvcc

all: conan-install build-debug

.PHONY: delete conan-install

delete: 
	@echo "Deleting temp files..."
	rm -rf $(SHARED_LIBRARIES) $(CACHE_FILES)

conan-install: $(CONAN_CONFIG_FILE)
	@echo "Installing dependencies with conan..."
	conan install . --output-folder=$(CONAN_OUTPUT_DIR) --build=missing

build-debug:
	@echo "Building project in Debug mode..."
	cmake . $(CMAKE_COMMON_FLAGS) -DCMAKE_BUILD_TYPE=Debug
	ninja
