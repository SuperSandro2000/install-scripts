#!/bin/bash
set -eoux pipefail

_git() {
  dir=$(echo "$1" | \grep -oP '\w+(?=.git)')
  git clone "$1" || (cd "$dir" && git fetch origin && git reset --hard origin/master)
  cd "$dir"
}

_make() {
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../
  make
  sudo make install
}

libbaseencode=1.0.9
libctop=1.2.2
otpclient=2.0.1

sudo apt-get install --no-install-recommends -qy ca-certificates cmake g++ git make pkg-config
mkdir -p "$HOME/src" && cd "$HOME/src/"

# libbaseencode
_git https://github.com/paolostivanin/libbaseencode.git
git checkout v$libbaseencode
_make

# libcotp
sudo apt-get install -qy libgcrypt20-dev
_git https://github.com/paolostivanin/libcotp.git
git checkout v$libctop
_make

# otpclient
sudo apt-get install -qy libgcrypt20-dev libjansson-dev libzbar-dev libzip-dev
_git https://github.com/paolostivanin/OTPClient.git
git checkout v$otpclient
_make
