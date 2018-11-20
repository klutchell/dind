#!/bin/sh

# set timezone if one was provided
[ -n "${TZ}" ] && sudo ln -snf "/usr/share/zoneinfo/${TZ}" /etc/localtime && echo "${TZ}" | sudo tee /etc/timezone

# start docker daemon in the background
sudo /usr/bin/dockerd &

# start sshd service in foreground
sudo /usr/sbin/sshd -p 22 -D
