#!/bin/bash
set -eoux pipefail

shellcheck="shellcheck-stable.linux.x86_64.tar.xz"

sudo apt-get install -qy tar wget
wget https://storage.googleapis.com/shellcheck/$shellcheck
tar -xf $shellcheck
rm $shellcheck
sudo mv shellcheck-stable/shellcheck /usr/bin/shellcheck
rm -r shellcheck-stable
