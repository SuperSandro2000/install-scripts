#!/bin/bash
set -eoux pipefail

sudo apt-get install -qy ddclient git perl libdata-validate-ip-perl libjson-any-perl
mkdir -p "$HOME"/src
cd "$HOME"/src
git clone https://github.com/ddclient/ddclient.git && cd ddclient || cd ddclient && git fetch origin && git reset --hard origin/master
sudo cp ddclient /usr/sbin/
sudo mkdir -p /etc/ddclient/
