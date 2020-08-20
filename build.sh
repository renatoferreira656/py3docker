#!/bin/bash -xe

USER_ID=$(id -u)
GROUP_ID=$(id -g)
USERNAME=$(id -un)
docker build --build-arg USERNAME=$USERNAME --build-arg USER_ID=$USER_ID --build-arg GROUP_ID=$GROUP_ID -t py3docker:latest .

sudo rm -rf /usr/bin/py3docker || true
sudo ln -s $(pwd)/bin/py3docker /usr/bin/py3docker 