#!/bin/bash
set -eoux pipefail

sudo apt-get install --no-install-recommends -qy git wget
mkdir -p "$HOME/.local/bin"
wget https://raw.githubusercontent.com/fboender/multi-git-status/master/mgitstatus -O "$HOME/.local/bin/mgitstatus"
chmod +x "$HOME/.local/bin/mgitstatus"
