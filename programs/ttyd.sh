#!/bin/bash
set -eoux pipefail

sudo apt-get install -qy build-essential cmake git libjson-c-dev libwebsockets-dev pkg-config
cd "$HOME/src/"
git clone https://github.com/tsl0922/ttyd.git || (cd ttyd && git fetch origin && git reset --hard origin/master)
mkdir -p ttyd/build && cd ttyd/build
cmake ..
make
sudo make install
