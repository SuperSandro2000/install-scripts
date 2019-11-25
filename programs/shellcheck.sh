#!/bin/bash
set -eoux pipefail

file="shellcheck-stable.linux.x86_64.tar.xz"

trap 'rm $file' EXIT

sudo apt-get install -qy tar xz-utils wget
wget https://storage.googleapis.com/shellcheck/$file
tar -xf $file
sudo mv shellcheck-stable/shellcheck /usr/bin/shellcheck
rm -r shellcheck-stable
