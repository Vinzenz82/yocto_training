# Use Presets with CMAKE

## List Configure and Build Presets

```sh
# cmake --list-presets
Available configure presets:
...
# cmake --build --list-presets&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Available build presets:
```

## Configure and Build

```sh
cmake --preset Debug_x64               << configure preset 
cmake --build --preset Build_Debug_x64 << build preset
```


# Set Static IP

/usr/lib/systemd/network/80-wired.network.

Edit like:

```bash
[Match]
Name=enp6s0

[Network]
Address=129.*****.235/24
Gateway=129.*****.1
DNS=129.*****.1
```

sudo systemctl restart systemd-networkd
networkctl status


