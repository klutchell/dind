FROM ubuntu

ARG BUILD_DATE
ARG BUILD_VERSION

LABEL build_version="${BUILD_VERSION}"
LABEL build_date="${BUILD_DATE}"
LABEL maintainer="kylemharding@gmail.com"

# default timezone
ENV TZ America/Toronto

# avoid prompts during package installation
ENV DEBIAN_FRONTEND noninteractive

# install updates and common utilities
RUN apt-get update && apt-get install -yq --no-install-recommends \
	apt-transport-https \
	bash-completion \
	build-essential \
	ca-certificates \
	curl \
	git \
	gnupg2 \
	openssh-server \
	software-properties-common \
	sudo \
	tzdata \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install docker
RUN curl -fsSL https://get.docker.com | sh \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# use volume for docker graph
VOLUME /var/lib/docker

# disable sshd password auth
RUN sed -r \
	-e 's/^(#)?PasswordAuthentication .+$/PasswordAuthentication no/' \
	-i /etc/ssh/sshd_config

# create privilege separation directory
RUN mkdir /run/sshd

# install rmate
RUN curl -fsSL https://raw.githubusercontent.com/aurora/rmate/master/rmate -o /usr/local/bin/rmate \
	&& chmod a+x /usr/local/bin/rmate

# create user account
RUN useradd -ms /bin/bash -G sudo,docker dind \
	&& echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# switch to dind user
USER dind

# work in home dir
WORKDIR /home/dind

# expose ssh port
EXPOSE 22

# set default shell to bash
ENV SHELL /bin/bash

# copy start script
COPY start.sh /

# run start script on boot
CMD ["/bin/sh", "/start.sh"]
