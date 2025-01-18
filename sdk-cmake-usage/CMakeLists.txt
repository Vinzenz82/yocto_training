cmake_minimum_required(VERSION 3.10)

# set the project name and version
project(HelloWorld VERSION 1.0)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# add the executable
add_executable(HelloWorld main.cxx)
 
target_compile_options(HelloWorld PUBLIC
                      #-v
                      -mthumb 
                      -mfpu=neon-vfpv4 
                      -mfloat-abi=hard 
                      -mcpu=cortex-a7 
                      -fstack-protector-strong  
                      -O2 
                      -D_FORTIFY_SOURCE=2 
                      -Wformat=1 
                      -Wformat-security 
                      -Werror=format-security 
                      --sysroot=${TOOLCHAIN_SYSROOT}
                 )

target_link_options(HelloWorld PUBLIC 
                     -Wl,-O1 
                     -Wl,--hash-style=gnu 
                     -Wl,--as-needed 
                     -Wl,-z,relro,-z,now
                     --sysroot=${TOOLCHAIN_SYSROOT})

add_custom_command(TARGET HelloWorld POST_BUILD
                    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                    COMMAND python3 -m venv ${CMAKE_CURRENT_BINARY_DIR}/.venv
                    COMMAND ${CMAKE_CURRENT_BINARY_DIR}/.venv/bin/pip install patchelf
                    COMMAND ${CMAKE_CURRENT_BINARY_DIR}/.venv/bin/patchelf --set-interpreter /lib/ld-linux-armhf.so.3 ${CMAKE_CURRENT_BINARY_DIR}/HelloWorld
                    COMMAND scp ${CMAKE_CURRENT_BINARY_DIR}/HelloWorld scp://root@192.168.1.211
                  )


