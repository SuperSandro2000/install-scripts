#!/bin/bash
set -eoux pipefail

sudo apt-get install -qy git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
