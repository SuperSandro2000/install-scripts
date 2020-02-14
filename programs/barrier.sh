#!/bin/bash
set -eoux pipefail

if [[ $(id -u) != 0 ]]; then
  sudo=sudo
else
  sudo=
fi

$sudo apt-get install --no-install-recommends -qy cmake g++ git libavahi-compat-libdnssd-dev libcurl4-openssl-dev libssl-dev libxtst-dev qtbase5-dev
mkdir -p "$HOME/src/"
cd "$HOME/src/"
git clone --depth=1 https://github.com/debauchee/barrier.git || (cd barrier && git fetch origin && git reset --hard origin/master)
cd barrier || exit 1
./clean_build.sh
mkdir -p "$HOME/.local/bin/"
cp build/bin/barrier{,c,s} "$HOME/.local/bin/"
