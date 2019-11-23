#!/bin/bash
set -eoux pipefail

sudo apt-get install -qy curl
mkdir -p "$HOME/.local/bin"
curl -s https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -o "$HOME/.local/bin/diff-so-fancy"
chmod +x "$HOME/.local/bin/diff-so-fancy"
