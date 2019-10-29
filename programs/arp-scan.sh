#!/bin/bash
set -eoux pipefail

sudo apt-get install -qy build-essential git libpcap-dev
mkdir -p "$HOME/src/"
cd "$HOME/src/"
git clone git@github.com:royhills/arp-scan.git || (cd arp-scan && git fetch origin && git reset --hard origin/master)
cd arp-scan || exit 1
autoreconf --install
./configure
make
make check
sudo make install
