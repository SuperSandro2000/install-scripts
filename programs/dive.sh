#!/bin/bash
set -eoux pipefail

dive=0.7.2

sudo apt-get install -qy wget
wget https://github.com/wagoodman/dive/releases/download/v$dive/dive_"$dive"_linux_amd64.deb
sudo apt-get install ./dive_"$dive"_linux_amd64.deb
rm dive_"$dive"_linux_amd64.deb
