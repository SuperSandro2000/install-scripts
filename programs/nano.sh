#!/bin/bash
set -eoux pipefail

version=4.7
file=nano-$version.tar.xz

sudo apt-get install --no-install-recommends -qy gcc gpg libncurses-dev make tar wget xz-utils
mkdir -p "$HOME/src" && cd "$HOME/src/"
wget "https://www.nano-editor.org/dist/v4/$file"
wget "https://www.nano-editor.org/dist/v4/$file.asc"
gpg --keyserver keys.gnupg.net --recv-keys 0x0D28D4D2A0ACE884
gpg --verify "$file.asc" "$file"
tar xf "$file"
rm -r "$file" "$file.asc"
cd "nano-$version"
# use to install to user
# ./configure --prefix="$HOME/.local/"
./configure
make
sudo make install
cd "$HOME"
