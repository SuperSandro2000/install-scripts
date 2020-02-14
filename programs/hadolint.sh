#!/bin/bash
set -eoux pipefail

version=1.17.5

if [[ $(id -u) != 0 ]]; then
  sudo=sudo
else
  sudo=
fi

$sudo apt-get install --no-install-recommends -qy wget
mkdir -p "$HOME/.local/bin"
wget "https://github.com/hadolint/hadolint/releases/download/v$version/hadolint-Linux-x86_64" -O "$HOME/.local/bin/hadolint"
chmod +x "$HOME/.local/bin/hadolint"
