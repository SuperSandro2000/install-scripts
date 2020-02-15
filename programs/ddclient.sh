#!/bin/bash
set -eoux pipefail

if [[ $(id -u) != 0 ]]; then
  sudo=sudo
else
  sudo=
fi

$sudo apt-get install --no-install-recommends -qy ddclient git perl libdata-validate-ip-perl libjson-any-perl
mkdir -p "$HOME"/src
cd "$HOME"/src
git clone https://github.com/ddclient/ddclient.git || (cd ddclient && git fetch origin && git reset --hard origin/master)
cd ddclient
$sudo cp ddclient /usr/sbin/
$sudo mkdir -p /etc/ddclient/
