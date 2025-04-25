include_guard()
include(FetchContent)

FetchContent_Declare(
    benchmark
    GIT_REPOSITORY https://github.com/google/benchmark.git
    GIT_TAG origin/main
)

set(BENCHMARK_ENABLE_TESTING NO)
FetchContent_MakeAvailable(benchmark)