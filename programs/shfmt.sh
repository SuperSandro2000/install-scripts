#!/bin/bash
set -eoux pipefail

version=3.0.1
file=shfmt_v${version}_linux_amd64

if [[ $(id -u) != 0 ]]; then
  sudo=sudo
else
  sudo=
fi

$sudo apt-get install --no-install-recommends -qy ca-certificates wget
mkdir -p "$HOME/.local/bin"
wget https://github.com/mvdan/sh/releases/download/v$version/$file -O "$HOME/.local/bin/shfmt"
chmod +x "$HOME/.local/bin/shfmt"
