set(avx_ex25_srcs ex25_test.cpp sqrtps_divps_sse.c vsqrtps_vdivps_avx.c)
if(CMAKE_CXX_COMPILER_ID MATCHES Clang OR CMAKE_CXX_COMPILER_ID MATCHES GNU OR CMAKE_CXX_COMPILER_ID MATCHES AppleClang)
set(avx_ex25_srcs ${avx_ex25_srcs} sqrtps_divps_sse.s vsqrtps_vdivps_avx.s)
elseif(MSVC)
set(avx_ex25_srcs ${avx_ex25_srcs} sqrtps_divps_sse.asm vsqrtps_vdivps_avx.asm)
endif()
add_executable(avx_ex25_tests ${avx_ex25_srcs})

target_link_libraries(avx_ex25_tests gtest_main)
add_test(NAME avx_ex25_test COMMAND avx_ex25_tests)
