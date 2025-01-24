## Write Image with bmaptool

Delete existing partitions on the block device.

Set permission to the block device:

```bash
sudo chmod 666 /dev/mmcblk0
```

Write Image:

```bash
oe-run-native bmap-tools-native bmaptool copy ./build/tmp/deploy/images/raspberrypi4/core-image-full-cmdline-raspberrypi4.wic.bz2 /dev/mmcblk0
```
