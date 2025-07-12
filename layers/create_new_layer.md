# Create and Modify a new Layer

## Create

- set shell environment on poky dir: `source oe-init-build-env build`
- create new layer in poky dir (**!**): `bitbake-layers create-layer ./meta-custom`
- add layer with: `bitbake-layers add-layer ../meta-custom/` in build dir (**!**)
- test build with `bitbake core-image-full-cmdline`

## Modify

### Show Dependency to other Layers

layer.conf:

`LAYERDEPENDS_meta-custom = "core openembedded-layer"`

### Add Recipes to Image

layer.conf:

`IMAGE_INSTALL:append = " p7zip atop i2c-tools"`
