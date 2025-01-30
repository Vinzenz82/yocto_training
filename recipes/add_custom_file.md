# Add a Cutom File to the Image

## Create a new Layer
[see doc](layers/create_new_layer.md)

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
│   └───add-custom-file
│       │   add-custom-file.bb
|       |
│       └───files
|           | custom-file.sh
|           |
```

## Conent of Files

### add-custom-file.bb

```bb
SUMMARY = "Simple recipe to add custom file to image."
SECTION = "examples"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

# we add a bash script so it depends on bash
RDEPENDS:${PN} += " bash "

SRC_URI = "file://custom-file.sh "
FILES:${PN} = "/usr/custom-file.sh "

S = "${WORKDIR}"

# prefix refer to /usr
do_install() {
    install -d ${D}${prefix}
    install -m 0755 custom-file.sh ${D}${prefix}
}
```

### custom-file.sh

```sh
#!/bin/bash
echo "This is a custom bash script."
```

### Add Recipe to layer.conf

layer.conf:

```b
# append some recipes
IMAGE_INSTALL:append = " add-custom-file"
```
