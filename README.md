# octoklip
Octoprint + Klipper docker image

## binfmt
```shell
docker run --rm --privileged docker/binfmt:820fdd95a9972a5308930a2bdfb8573dd4447ad3
```

## OctoPrint

```shell
cd octoprint
docker buildx build --platform linux/arm/v7,linux/amd64 . -t burgrp/octoprint --push
```

## Klipper

```shell
cd klipper
docker buildx build --platform linux/arm/v7,linux/amd64 . -t burgrp/klipper --push
```

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