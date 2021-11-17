# octoklip
Octoprint + Klipper docker image

## Docker images build

```sh
./build-docker-images
```

## DEVICE.FARM installation

Host image build for Raspberry 2 B:
```sh
export BUILDER_HOME=$HOME/df/image-builder/builder
$BUILDER_HOME/build burgrp/rpi-2-b-octoprint rpi-2-b dropbear avahi ./host-image-layer $BUILDER_HOME/../device-farm
```

Host image installation:
```sh
defa install <device-id> /dev/mmcblk0 --wifi=ssid:password --ssh - -i burgrp/rpi-2-b-octoprint
```

```sh
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

## Klipper3D firmware for Anet A8 using USBASP

### build and flash firmware

```sh
sudo apt-get install avrdude gcc-avr avr-libc
git clone https://github.com/KevinOConnor/klipper.git
cd klipper
make menuconfig
# select atmega1284p
make
avrdude -p atmega1284p -c usbasp -U out/klipper.elf.hex
```
### USBASP to Anet A8 wiring

```
 USBASP                                      Anet A8  6pin  10 pin
--------                                     ---------------------

 1 MOSI -----------\                                          1
 2 5V   ----------- \ --\                                     2
 3 GND               \   \             /------ MISO    1      3
 4 GND                \   \---------- / ------ 5V      2      4
 5 RST  -----------\   \       /---- / ------- SCK     3      5
 6 GND              \   \---- / --- / -------- MOSI    4      6
 7 SCK  ----\        \------ / --- / --------- RST     5      7
 8 GND       \--------------/     /    /------ GND     6      8
 9 MISO -------------------------/    /                       9
10 GND  -----------------------------/                       10
```
