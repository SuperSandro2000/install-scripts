#!/bin/bash
set -eoux pipefail

sudo apt-get install --no-install-recommends -qy git wget
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf || (cd ~/.fzf && git fetch origin && git reset --hard origin/master)
~/.fzf/install
