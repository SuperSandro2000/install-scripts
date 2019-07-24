#!/bin/bash
set -eoux pipefail

sudo apt-get install -qy git
git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop
/tmp/gotop/scripts/download.sh
rm -r /tmp/gotop/
mv gotop "$HOME/.local/bin/"
