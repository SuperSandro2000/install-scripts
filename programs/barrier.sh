#!/bin/bash
set -eoux pipefail

sudo apt-get install -qy cmake git libavahi-compat-libdnssd-dev libcurl4-openssl-dev libssl-dev libxtst-dev qtbase5-dev
mkdir -p "$HOME/src/"
cd "$HOME/src/"
git clone git@github.com:debauchee/barrier.git || (cd barrier && git fetch origin && git reset --hard origin/master)
cd barrier || exit 1
./clean_build.sh
mkdir -p "$HOME/.local/bin/"
cp barrier/build/bin/barrier{,c,s} "$HOME/.local/bin/"
