# Create Image for Raspberry Pi Zero W based on Scarthgap

# Firts Build

- Clone Poky into an empty folder:
`git clone git://git.yoctoproject.org/poky -b scarthgap`

- Go into the new poky folder and call:
`./scripts/install-buildtools`
to install all necessarry tools.

- Create the build env with:
`source oe-init-build-env build`.

- Call `bitbake-layers layerindex-fetch meta-raspberrypi` to add the raspberry layer automatically.

- Open the file `./conf/local.conf` and modify it:
```bb
MACHINE ??= "raspberrypi0-wifi"
```
