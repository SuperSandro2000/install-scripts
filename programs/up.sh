#!/bin/bash
set -eoux pipefail

sudo apt-get install --no-install-recommends -qy ca-certificates git
git clone --depth 1 https://github.com/shannonmoeller/up.git ~/.up
echo "[ -f ~/.up/up.sh ] && source ~/.up/up.sh" >>"$HOME/.bashrc"
