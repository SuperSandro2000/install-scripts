#!/bin/bash
set -eoux pipefail

version=1.17.2

sudo apt-get install -qy wget
mkdir -p "$HOME/.local/bin"
wget "https://github.com/hadolint/hadolint/releases/download/v$version/hadolint/hadolint-Linux-x86_64" -O "$HOME/.local/bin/hadolint"
chmod +x "$HOME/.local/bin/hadolint"
