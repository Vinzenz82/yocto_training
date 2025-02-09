# Generate and Use a CMAKE friendly SDK

## Create the SDK

Add the configuration key:

```bb
# generate cmale friendly sdk
TOOLCHAIN_HOST_TASK += "nativesdk-cmake"
```

and generate the SDK with:

`bitbake rpi-test-image -c populate_sdk`
