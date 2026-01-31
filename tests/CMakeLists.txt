enable_testing()

message("Tests CmakeLists.txt")

find_package(GTest REQUIRED)

add_executable(
  statevec_test
  statevec_test.cc
)

target_include_directories(statevec_test PRIVATE ${CUQUANTUM_INCLUDE_DIRS})
target_include_directories(statevec_test PRIVATE ${CUDA_INCLUDE_DIRS})

add_library(custatevec SHARED IMPORTED)
set_target_properties(custatevec PROPERTIES
	IMPORTED_LOCATION "${CUQUANTUM_LIB_DIRS}/libcustatevec.so"
	INTERFACE_INCLUDE_DIRECTORIES "${CUQUANTUM_INCLUDE_DIRS}"
)

message(STATUS "GTest found: ${GTest_FOUND}")
message(STATUS "GTest Include Dirs: ${GTest_INCLUDE_DIRS}")
message(STATUS "GTest Libraries: ${GTest_LIBRARIES}")
message(STATUS "CUDA dir: ${CUDA_INCLUDE_DIRS}")
message(STATUS "CuQuantum include dir: ${CUQUANTUM_INCLUDE_DIRS}")
message(STATUS "CuQuantum lib dir: ${CUQUANTUM_LIB_DIRS}")

target_link_libraries(
	statevec_test
	GTest::gtest_main
	custatevec
)

include(GoogleTest)
gtest_discover_tests(statevec_test)
