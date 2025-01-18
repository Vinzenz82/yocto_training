# How to use the Standard SDK with CMAKE to Cross Compile C++

## build the SDK
For C++ add to local.conf or customized layer:

```conf
#add libstdc++ to a Yocto (Poky) image
IMAGE_INSTALL:append = " libstdc++"

#add libstdc++ to the Yocto SDK
TOOLCHAIN_TARGET_TASK:append = " libstdc++-staticdev"
```

Populate the SDK with:

```bash
bitbake core-image-full-cmdline -c populate_sdk
```
## install the SDK

from Yocto build directory:

```bash
./tmp/deploy/sdk/poky-glibc-x86_64-core-image-full-cmdline-cortexa7t2hf-neon-vfpv4-raspberrypi4-toolchain-4.0.24.sh
```


## build the sample 
```shell
cmake . -B ./build -DCMAKE_TOOLCHAIN_FILE=arm-gcc-toolchain.cmake -DCMAKE_BUILD_TYPE=Debug
cmake --build ./build
```
