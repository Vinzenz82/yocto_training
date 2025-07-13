# Add a Cutom File to the Image

## Create a new Layer
[see doc](../layers/create_new_layer.md)

## Create a new Recipe

```
layer-custom
│   COPYING.MIT
│   README    
│
└───conf
|
└───recipes-core
│   │   
│   │
│   └───cmake-example
│       │   bb-cmake-example_git.bb
```

## Content of Files

### bb-cmake-example_git.bb

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
SRCREV = "768fc23b90434d814b53b3c183a72eac7f843766"

python do_display_banner() {
    bb.plain("***********************************************");
    bb.plain("*                                             *");
    bb.plain("*  Example recipe cmake-example: do_fetch     *");
    bb.plain("*                                             *");
    bb.plain("***********************************************");
}

python do_display_banner_p() {
    bb.plain("***********************************************");
    bb.plain("*                                             *");
    bb.plain("*  Example recipe cmake-example: do_package   *");
    bb.plain("*                                             *");
    bb.plain("***********************************************");
}

# set package version
PV = "1.0+git${SRCPV}"

# set source dir
S = "${WORKDIR}/git"

inherit cmake

# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
EXTRA_OECMAKE = ""

addtask do_display_banner before do_fetch
addtask do_display_banner_p before do_package
```

### Add Recipe to layer.conf

custom-layer: layer.conf:

```b
# append some recipes
IMAGE_INSTALL:append = " bb-cmake-example"
```
