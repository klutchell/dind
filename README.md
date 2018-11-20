# docker-in-docker

docker-in-docker images with an ssh & textmate server

## Build

```bash
# build x86_64 image
make

# build armhf image
make armhf
```

## Deploy

```bash
# push x86_64 image
make push

# push armhf image
make push-armhf

# tag release version
make tag
```

## Usage

```bash
docker run -d \
    --name dind \
    --restart unless-stopped \
    --privileged \
    -p '2222:22/tcp' \
    -v 'dind-home:/home/dind' \
    -e 'TZ=America/Toronto' \
    klutchell/dind
```

## Environment

|Name|Description|Example|
|---|---|---|
|`TZ`|(optional) set container timezone|`America/Toronto`|

## Author

Kyle Harding <kylemharding@gmail.com>

## License

[MIT License](./LICENSE)

## Acknowledgments

_tbd_