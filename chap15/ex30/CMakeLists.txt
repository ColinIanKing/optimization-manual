set(avx_ex30_srcs ex30_test.cpp sqrt_rsqrtps_taylor_sse.c sqrt_vrsqrtps_taylor_avx.c)
if(CMAKE_CXX_COMPILER_ID MATCHES Clang OR CMAKE_CXX_COMPILER_ID MATCHES GNU OR CMAKE_CXX_COMPILER_ID MATCHES AppleClang)
set(avx_ex30_srcs ${avx_ex30_srcs} sqrt_rsqrtps_taylor_sse.s sqrt_vrsqrtps_taylor_avx.s)
elseif(MSVC)
set(avx_ex30_srcs ${avx_ex30_srcs} sqrt_rsqrtps_taylor_sse.asm sqrt_vrsqrtps_taylor_avx.asm)
endif()
add_executable(avx_ex30_tests ${avx_ex30_srcs})

target_link_libraries(avx_ex30_tests gtest_main)
add_test(NAME avx_ex30_test COMMAND avx_ex30_tests)
