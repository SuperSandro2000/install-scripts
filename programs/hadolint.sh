#!/bin/bash
set -eoux pipefail

version=1.17.3

sudo apt-get install --no-install-recommends -qy wget
mkdir -p "$HOME/.local/bin"
wget "https://github.com/hadolint/hadolint/releases/download/v$version/hadolint-Linux-x86_64" -O "$HOME/.local/bin/hadolint"
chmod +x "$HOME/.local/bin/hadolint"
