# Generate and Use a CMAKE friendly SDK

## Create the SDK

Add the configuration key:

```bb
# generate cmake friendly sdk
TOOLCHAIN_HOST_TASK:append = "${SDK_EXTRA_TOOLS}" 
# add static libs to SDK
SDK_EXTRA_TOOLS = " nativesdk-cmake     " 
SDKIMAGE_FEATURES += " staticdev-pkgs"
```

and generate the SDK with:

`bitbake rpi-test-image -c populate_sdk`

## Install the SDK

from Yocto build directory:
`./tmp/deploy/sdk/poky-glibc-x86_64-rpi-test-image-arm1176jzfshf-vfp-raspberrypi0-wifi-toolchain-5.0.7.sh`

y default the SDK will be installed in:
`/opt/poky/5.0.7`

## Usage

```sh
cmake . -B ./build -DCMAKE_TOOLCHAIN_FILE=/opt/poky/5.0.7/sysroots/x86_64-pokysdk-linux/usr/share/cmake/arm1176jzfshf-vfp-poky-linux-gnueabi-toolchain.cmake -DCMAKE_BUILD_TYPE=Debug
cmake --build ./build
```
