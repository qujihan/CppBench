cmake_minimum_required(VERSION 4.0.0)

project(
    TestProject
    VERSION 1.0.0
    LANGUAGES CXX
)  

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)  

include(cmake/GoogleBenchmark.cmake)

add_executable(main main.cc)  
target_link_libraries(main benchmark)