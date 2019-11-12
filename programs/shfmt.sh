#!/bin/bash
set -eoux pipefail

version=2.6.4
file=shfmt_v${version}_linux_amd64

sudo apt-get install -qy wget
wget https://github.com/mvdan/sh/releases/download/v$version/$file -O "$HOME/.local/bin/shfmt"
chmod +x "$HOME/.local/bin/shfmt"
