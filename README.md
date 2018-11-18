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

## Usage

_tbd_

## Author

Kyle Harding <kylemharding@gmail.com>

## License

[MIT License](./LICENSE)

## Acknowledgments

_tbd_