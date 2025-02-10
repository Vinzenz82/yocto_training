# Generate and Use a CMAKE friendly SDK

## Create the SDK

Add the configuration key:

```bb
# generate cmake friendly sdk
TOOLCHAIN_HOST_TASK:append = "${SDK_EXTRA_TOOLS}" 
SDK_EXTRA_TOOLS = " nativesdk-cmake     " 
```

and generate the SDK with:

`bitbake rpi-test-image -c populate_sdk`

## Usage

`cmake . -B ./build -DCMAKE_TOOLCHAIN_FILE=/opt/poky/5.0.7/sysroots/x86_64-pokysdk-linux/usr/share/cmake/arm1176jzfshf-vfp-poky-linux-gnueabi-toolchain.cmake -DCMAKE_BUILD_TYPE=Debug`

`cmake --build ./build`
