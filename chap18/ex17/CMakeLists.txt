set(avx512_ex17_tests ex17_test.cpp scalar_scatter.c software_scatter.c hardware_scatter.c)
if(CMAKE_CXX_COMPILER_ID MATCHES Clang OR CMAKE_CXX_COMPILER_ID MATCHES GNU OR CMAKE_CXX_COMPILER_ID MATCHES AppleClang)
set(avx512_ex17_tests ${avx512_ex17_tests} scalar_scatter.s software_scatter.s hardware_scatter.s)
elseif(MSVC)
set(avx512_ex17_tests ${avx512_ex17_tests} scalar_scatter.asm software_scatter.asm hardware_scatter.asm)
endif()
add_executable(avx512_ex17_tests ${avx512_ex17_tests})

target_link_libraries(avx512_ex17_tests gtest_main optimisation_common)
add_test(NAME avx512_ex17_test COMMAND avx512_ex17_tests)
