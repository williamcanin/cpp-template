SHELL := /bin/bash
BUILD_DIR := build
TOOLCHAIN := $(VCPKG_ROOT)/scripts/buildsystems/vcpkg.cmake
PROJECT_NAME := $(shell grep -oP 'project\(\K[^ )]+' CMakeLists.txt)

.PHONY: debug release run tests clean

debug: clean
	@cmake -B $(BUILD_DIR) -S . \
		-DCMAKE_TOOLCHAIN_FILE=$(TOOLCHAIN) \
		-DCMAKE_BUILD_TYPE=Debug
	@cmake --build $(BUILD_DIR)

release: clean
	@cmake -B $(BUILD_DIR) -S . \
		-DCMAKE_TOOLCHAIN_FILE=$(TOOLCHAIN) \
		-DCMAKE_BUILD_TYPE=Release
	@cmake --build $(BUILD_DIR)

run:
	@./$(BUILD_DIR)/$(PROJECT_NAME) $(filter-out $@,$(MAKECMDGOALS))

%:
	@:

tests: debug
	@ctest --test-dir $(BUILD_DIR) -V

clean:
	@rm -rf $(BUILD_DIR)