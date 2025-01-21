# Using Recipes From Layers

## Resources

[Yocto Index](https://git.yoctoproject.org/)

[OpenEmbedded Layer Index](https://layers.openembedded.org/layerindex/branch/master/layers/)

## Quick'n'Dirty

Clone the layer to the `poky` directory:
```bash
git clone https://github.com/openembedded/meta-openembedded.git -b kirkstone
```

Add the layer to the `./build/conf/bblayers.conf` with
```bash
bitbake-layers add-layer ./meta-openembedded/meta-oe/
```

Add the needed recipe to `local.conf`
```bb
IMAGE_INSTALL:append = " p7zip"
```

Compile the preferred image
```bash
bitbake core-image-full-cmdline
```
