#!/bin/bash
set -eoux pipefail

sudo apt-get install -qy curl
mkdir -p "$HOME/.local/bin"
curl -s https://raw.githubusercontent.com/fboender/multi-git-status/master/mgitstatus -o "$HOME/.local/bin/mgitstatus"
chmod +x "$HOME/.local/bin/mgitstatus"
