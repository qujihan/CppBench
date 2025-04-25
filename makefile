DEBUG_DIR   = build/debug
RELEASE_DIR = build/release
CLANGD_DIR  = build/clangd

.PHONY: all clangd cmake build run clean

all: run

clangd:
	@cmake -B ${CLANGD_DIR} -S . -G "Ninja" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

debug_gen: clangd

release_gen: clangd

debug: clangd
	@cmake -B ${DEBUG_DIR} -S . -G "Ninja" -DCMAKE_BUILD_TYPE=Debug
	@cmake --build ${DEBUG_DIR}

release: clangd
	@cmake -B ${RELEASE_DIR} -S . -G "Ninja" -DCMAKE_BUILD_TYPE=Release
	@cmake --build ${RELEASE_DIR}

run: debug
	@echo "\n\n\n"
	@${DEBUG_DIR}/main

bench: release
	@echo "\n\n\n"
	@${RELEASE_DIR}/main

clean:
	@rm -rf build