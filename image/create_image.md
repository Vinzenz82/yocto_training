# Craete a new Image based on existing Image

## Create a new Layer
[see doc](layers/create_new_layer.md)

## Create Image

Create new file in `recipes-core/images`:

```bb
require recipes-extended/images/core-image-full-cmdline.bb

python do_display_banner() {
    bb.plain("***********************************************");
    bb.plain("*                                             *");
    bb.plain("*  Layer: Meta-Custom: do_build custom-image  *");
    bb.plain("*                                             *");
    bb.plain("***********************************************");
}

addtask display_banner before do_build

IMAGE_FEATURES:remove = "splash"
IMAGE_FEATURES+= "debug-tweaks dbg-pkgs tools-debug ssh-server-openssh "
```

Compile the image with:

`bitbake custom-image`

Flash it with:

`oe-run-native bmap-tools-native bmaptool copy ./build/tmp/deploy/images/raspberrypi4/custom-image-raspberrypi4.wic.bz2 /dev/sdb`

see also [doc](image/bmaptool.md)
