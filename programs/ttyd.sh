#!/bin/bash
set -eoux pipefail

if [[ $(id -u) != 0 ]]; then
  sudo=sudo
else
  sudo=
fi

$sudo apt-get install --no-install-recommends -qy ca-certificates cmake gcc git make libjson-c-dev libwebsockets-dev
mkdir -p "$HOME/src/"
cd "$HOME/src/"
git clone --depth=1 https://github.com/tsl0922/ttyd.git || (cd ttyd && git fetch origin && git reset --hard origin/master)
mkdir -p ttyd/build && cd ttyd/build
cmake ..
make
$sudo make install
