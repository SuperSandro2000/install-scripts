#!/bin/bash
set -eoux pipefail

trap "rm -r /tmp/gotop/" EXIT

if [[ $(id -u) != 0 ]]; then
  sudo=sudo
else
  sudo=
fi

$sudo apt-get install --no-install-recommends -qy curl git
git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop
/tmp/gotop/scripts/download.sh
mkdir -p "$HOME/.local/bin/"
mv gotop "$HOME/.local/bin/"
