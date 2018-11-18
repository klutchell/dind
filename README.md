# docker-in-docker

docker-in-docker images with an ssh & textmate server

## Build

```bash
# build for x86_64
make

# build for armhf
make armhf
```

## Deploy

```bash
docker run -d \
    --name dind \
    --restart unless-stopped \
    --privileged \
    -p '2222:22/tcp' \
    -v 'dind-home:/home/dind' \
    klutchell/dind
```

## Environment

|Name|Description|Example|
|---|---|---|
|`TZ`|(optional) container timezone|`America/Toronto`|

## Usage

_tbd_

## Author

Kyle Harding <kylemharding@gmail.com>

## License

[MIT License](./LICENSE)

## Acknowledgments

_tbd_