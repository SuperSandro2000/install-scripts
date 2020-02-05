#!/bin/bash
set -eoux pipefail

sudo apt-get install --no-install-recommends -qy autoconf gcc git libpcap-dev make

mkdir -p "$HOME/src/"
cd "$HOME/src/"
git clone --depth=1 https://github.com/royhills/arp-scan.git || (cd arp-scan && git fetch origin && git reset --hard origin/master)
cd arp-scan || exit 1

autoreconf --install
./configure
make
make check
sudo make install
