#!/bin/bash
set -eoux pipefail

trap "rm -r /tmp/gotop/" EXIT

sudo apt-get install -qy curl git
git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop
/tmp/gotop/scripts/download.sh
mkdir -p "$HOME/.local/bin/"
mv gotop "$HOME/.local/bin/"
