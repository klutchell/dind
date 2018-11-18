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

# tag release
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
    -e 'GITHUB_USER=klutchell' \
    klutchell/dind
```

## Environment

|Name|Description|Example|
|---|---|---|
|`TZ`|(optional) set container timezone|`America/Toronto`|
|`GITHUB_USER`|(optional) sync authorized_keys with github|`klutchell`|
|`DIND_OPTS`|(optional) docker daemon command line options|`--storage-driver aufs`|

## Author

Kyle Harding <kylemharding@gmail.com>

## License

[MIT License](./LICENSE)

## Acknowledgments

_tbd_