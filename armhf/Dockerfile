FROM resin/raspberrypi3-debian:stretch

ARG BUILD_DATE
ARG VERSION=latest

LABEL build_version="${VERSION}"
LABEL build_date="${BUILD_DATE}"
LABEL maintainer="kylemharding@gmail.com"

# allow building on x86
RUN [ "cross-build-start" ]

# enable openrc
ENV INITSYSTEM on

# install updates and common utilities
RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update && apt-get install -yq --no-install-recommends \
	apt-transport-https \
	bash-completion \
	sshfs \
	tmux \
	docker.io \
	kmod \
	aufs-tools \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# copy src files
WORKDIR /usr/src/app
COPY start.sh ./
COPY aufs-daemon.json /etc/docker/daemon.json

# run start script on boot
CMD ["/bin/sh", "start.sh"]

# allow building on x86
RUN [ "cross-build-start" ]

