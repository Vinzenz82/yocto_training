# Compile gdb and gdb-server for the target

## bitbake it

Add to local.conf or to customized layer:

```bb
EXTRA_IMAGE_FEATURES ?= "debug-tweaks dbg-pkgs tools-debug "
```

build the prefered image like:

```bb
bitbake core-image-full-cmdline
```

Flash the image to the target. 

## devtool it

Create and install the extensible SDK. Add to the local.conf of the workspace:

```bb
EXTRA_IMAGE_FEATURES ?= "debug-tweaks dbg-pkgs tools-debug"
```

Build the preffered image like:

```bb
devtool build-image core-image-full-cmdline
```
Flash the image to the target. 
