# How to use the Standard SDK with CMAKE to Cross Compile C++

## build the sample 
```shell
cmake . -B ./build -DCMAKE_TOOLCHAIN_FILE=arm-gcc-toolchain.cmake -DCMAKE_BUILD_TYPE=Debug
cmake --build ./build
```
