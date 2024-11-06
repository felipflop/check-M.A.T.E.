cmake_minimum_required(VERSION 3.13...3.27)

# initialize pico-sdk from submodule
include(../lib/pico-sdk/pico_sdk_init.cmake)

project(check_mate)

# initialize the Raspberry Pi Pico SDK
pico_sdk_init()

# rest of your project
add_subdirectory(app)