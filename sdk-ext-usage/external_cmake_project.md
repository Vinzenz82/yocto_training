# Add external CMAKE projet with devtool

## Prepare extensible SDK

Compile: (remove SDK mods in local.conf)
```bash
bitbake core-image-full-cmdline -c populate_sdk_ext
```

Install: (this is a workspace and not a general system SDK)
```bash
./tmp/deploy/sdk/poky-glibc-x86_64-core-image-full-cmdline-cortexa7t2hf-neon-vfpv4-raspberrypi4-toolchain-ext-4.0.24.sh
```
## Usage of the SDK

### Activate the extensible SDK inside a shell:

```bash
. /media/vinzenz/home/yocto/sdk-ext-rpi4/environment-setup-cortexa7t2hf-neon-vfpv4-poky-linux-gnueabi 
SDK environment now set up; additionally you may now run devtool to perform development tasks.
Run devtool --help for further details.
```

### Usage of CMAKE project from GitHub

Add:
```bash
devtool add --srcbranch main https://github.com/Vinzenz82/bb-cmake-example
```
Modify bb file (here: bb-cmake-example_git.bb)
```bb
# Recipe created by Vinzenz Petr

SECTION = "example"

# NOTE: LICENSE is being set to "CLOSED" to allow you to at least start building - if
# this is not accurate with respect to the licensing of the software being built (it
# will not be in most cases) you must specify the correct value before using this
# recipe for anything other than initial testing/development!
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

# No information for SRC_URI yet (only an external source tree was specified)
SRC_URI = "git://github.com/Vinzenz82/bb-cmake-example;protocol=https;branch=main"
SRCREV = "64e88f97885a44c8617737d647aaa394ce1dc728"

# set package version
PV = "1.0+git${SRCPV}"

# set source dir
S = "${WORKDIR}/git"

inherit cmake

# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
EXTRA_OECMAKE = ""
```


Build:
```bash
devtool build bb-cmake-example
```

Deploy:
```bash
devtool deploy-target bb-cmake-example root@192.168.1.211
```
