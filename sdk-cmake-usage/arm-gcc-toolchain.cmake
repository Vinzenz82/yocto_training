set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(TOOLCHAIN_SYSROOT /opt/poky/4.0.24/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-gnueabi)
set(TOOLCHAIN_PATH    /opt/poky/4.0.24/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/)
set(TOOLCHAIN_PREFIX arm-poky-linux-gnueabi-)
find_program(BINUTILS_PATH ${TOOLCHAIN_PATH}${TOOLCHAIN_PREFIX}gcc NO_CACHE)

if (NOT BINUTILS_PATH)
    message(FATAL_ERROR "ARM GCC toolchain not found")
endif ()

get_filename_component(ARM_TOOLCHAIN_DIR ${BINUTILS_PATH} DIRECTORY)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_C_COMPILER    ${TOOLCHAIN_PATH}${TOOLCHAIN_PREFIX}gcc)
set(CMAKE_ASM_COMPILER  ${TOOLCHAIN_PATH}${TOOLCHAIN_PREFIX}as)
set(CMAKE_CXX_COMPILER  ${TOOLCHAIN_PATH}${TOOLCHAIN_PREFIX}g++)
set(CMAKE_AR            ${TOOLCHAIN_PATH}${TOOLCHAIN_PREFIX}ar)
set(CMAKE_RANLIB        ${TOOLCHAIN_PATH}${TOOLCHAIN_PREFIX}gcc-ranlib)
set(CMAKE_NM            ${TOOLCHAIN_PATH}${TOOLCHAIN_PREFIX}unused CACHE STRING "Set the cross-compiler tool NM" FORCE)
set(CMAKE_LINKER        ${TOOLCHAIN_PATH}${TOOLCHAIN_PREFIX}unused CACHE STRING "Set the cross-compiler tool LD" FORCE)

execute_process(COMMAND ${CMAKE_C_COMPILER} -print-sysroot
    OUTPUT_VARIABLE ARM_GCC_SYSROOT OUTPUT_STRIP_TRAILING_WHITESPACE)

set(CMAKE_OBJCOPY ${ARM_TOOLCHAIN_DIR}/${TOOLCHAIN_PREFIX}objcopy CACHE INTERNAL "objcopy tool")
set(CMAKE_SIZE_UTIL ${ARM_TOOLCHAIN_DIR}/${TOOLCHAIN_PREFIX}size CACHE INTERNAL "size tool")

# # Default C compiler flags
# set(CMAKE_C_FLAGS_DEBUG_INIT "-g3 -Og -Wall -pedantic -DDEBUG")
# set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG_INIT}" CACHE STRING "" FORCE)
# set(CMAKE_C_FLAGS_RELEASE_INIT "-O3 -Wall")
# set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE_INIT}" CACHE STRING "" FORCE)
# set(CMAKE_C_FLAGS_MINSIZEREL_INIT "-Os -Wall")
# set(CMAKE_C_FLAGS_MINSIZEREL "${CMAKE_C_FLAGS_MINSIZEREL_INIT}" CACHE STRING "" FORCE)
# set(CMAKE_C_FLAGS_RELWITHDEBINFO_INIT "-O2 -g -Wall")
# set(CMAKE_C_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELWITHDEBINFO_INIT}" CACHE STRING "" FORCE)
# # Default C++ compiler flags
# set(CMAKE_CXX_FLAGS_DEBUG_INIT "-g3 -Og -Wall -pedantic -DDEBUG")
# set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG_INIT}" CACHE STRING "" FORCE)
# set(CMAKE_CXX_FLAGS_RELEASE_INIT "-O3 -Wall")
# set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE_INIT}" CACHE STRING "" FORCE)
# set(CMAKE_CXX_FLAGS_MINSIZEREL_INIT "-Os -Wall")
# set(CMAKE_CXX_FLAGS_MINSIZEREL "${CMAKE_CXX_FLAGS_MINSIZEREL_INIT}" CACHE STRING "" FORCE)
# set(CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "-O2 -g -Wall")
# set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT}" CACHE STRING "" FORCE)

set(CMAKE_SYSROOT ${ARM_GCC_SYSROOT})

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)