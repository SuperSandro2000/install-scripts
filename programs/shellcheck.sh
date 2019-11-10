#!/bin/bash
set -eoux pipefail

file="shellcheck-stable.linux.x86_64.tar.xz"

sudo apt-get install -qy tar wget
wget https://storage.googleapis.com/shellcheck/$shellcheck
tar -xf $file
rm $file
sudo mv shellcheck-stable/shellcheck /usr/bin/shellcheck
rm -r shellcheck-stable
