set(avx512_ex12_srcs ex12_test.cpp)
if(CMAKE_CXX_COMPILER_ID MATCHES Clang OR CMAKE_CXX_COMPILER_ID MATCHES GNU OR CMAKE_CXX_COMPILER_ID MATCHES AppleClang)
set(avx512_ex12_srcs ${avx512_ex12_srcs} ternary_avx2.s ternary_avx512.s ternary_vpternlog.s)
elseif(MSVC)
set(avx512_ex12_srcs ${avx512_ex12_srcs} ternary_avx2.asm ternary_avx512.asm ternary_vpternlog.asm)
endif()
add_executable(avx512_ex12_tests ${avx512_ex12_srcs})

target_link_libraries(avx512_ex12_tests gtest_main optimisation_common)
add_test(NAME avx512_ex12_test COMMAND avx512_ex12_tests)
