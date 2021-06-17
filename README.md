# octoklip
Octoprint + Klipper docker image

## Image build

### binfmt
```sh
docker run --rm --privileged docker/binfmt:820fdd95a9972a5308930a2bdfb8573dd4447ad3
```

### OctoPrint

```sh
cd octoprint
docker buildx build --platform linux/arm/v7,linux/amd64 . -t burgrp/octoprint --push
```

### Klipper

```sh
cd klipper
docker buildx build --platform linux/arm/v7,linux/amd64 . -t burgrp/klipper --push
```

## DEVICE.FARM installation

Host image build for OrangePi Zero:
```sh
export BUILDER_HOME=~/df/image-builder/builder
$BUILDER_HOME/build burgrp/orangepi-zero-octoprint \
    orangepi-zero \
    dropbear avahi \
    ./host-image-layer \
    $BUILDER_HOME/../device-farm
```

Host image installation:
```sh
defa install <device-id> /dev/mmcblk0 --wifi=ssid:password --ssh - -i burgrp/orangepi-zero-octoprint
```

```sh
cd compose
defa proxy <device-id> -- docker-compose up -d
```

## OctoPrint settings

### Shutdown Commands
Restart OctoPrint
```
pkill -f "octoprint serve"
```

Restart system
```
nsenter -t 1 -m -u -n -i reboot
```

Shutdown system
```
nsenter -t 1 -m -u -n -i poweroff
```
