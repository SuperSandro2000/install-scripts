#!/bin/bash
set -eoux pipefail

nano=4.3

sudo apt-get install -qy build-essential gpg libncursesw5-dev tar wget
mkdir -p "$HOME/src" && cd "$HOME/src/"
wget "https://www.nano-editor.org/dist/v4/nano-$nano.tar.xz"
wget "https://www.nano-editor.org/dist/v4/nano-$nano.tar.xz.asc"
gpg --recv-keys BFD009061E535052AD0DF2150D28D4D2A0ACE884
gpg --verify "nano-$nano.tar.xz.asc" "nano-$nano.tar.xz"
tar xf "nano-$nano.tar.xz"
rm -r "nano-$nano.tar.xz" "nano-$nano.tar.xz.asc"
cd "nano-$nano"
# use to install to user
# ./configure --prefix="$HOME/.local/"
./configure
make
sudo make install
cd "$HOME"

# install nanorc "Improved Nano Syntax Highlighting Files"
wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh
