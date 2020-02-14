#!/bin/bash
set -eoux pipefail

_git() {
  dir=$(echo "$1" | \grep -oP '\w+(?=.git)')
  if [[ -n $2 ]]; then
    git clone "$1" || _checkout "$dir" "$2"
  else
    git clone --depth=1 --branch "$2" "$1" || _checkout "$dir" "$2"
  fi
  cd "$dir"
}

_checkout() {
  cd "$1"
  git fetch origin
  git reset --hard "$2"
  cd ..
}

_make() {
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../
  make
  $sudo make install
}

libbaseencode=1.0.9
libctop=1.2.2
otpclient=2.0.1

if [[ $(id -u) != 0 ]]; then
  sudo=sudo
else
  sudo=
fi

$sudo apt-get install --no-install-recommends -qy ca-certificates cmake g++ git make pkg-config
mkdir -p "$HOME/src" && cd "$HOME/src/"

# libbaseencode
_git https://github.com/paolostivanin/libbaseencode.git v$libbaseencode
_make

# libcotp
$sudo apt-get install --no-install-recommends -qy libgcrypt20-dev
_git https://github.com/paolostivanin/libcotp.git v$libctop
_make

# otpclient
$sudo apt-get install --no-install-recommends -qy libgcrypt20-dev libgtk-3-dev libjansson-dev libzbar-dev libzip-dev
_git https://github.com/paolostivanin/OTPClient.git v$otpclient
_make
