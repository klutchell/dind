#!/bin/bash -xe

# clear the old docker.pid on restart
rm -rf /var/run/docker.pid

# start docker daemon
dockerd &

