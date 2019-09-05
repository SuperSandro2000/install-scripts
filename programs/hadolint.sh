#!/bin/bash
set -eoux pipefail

hadolint=1.17.1

sudo apt-get install -qy wget
mkdir -p "$HOME/.local/bin"
wget "https://github.com/hadolint/hadolint/releases/download/v$hadolint/hadolint-Linux-x86_64" -O "$HOME/.local/bin/hadolint"
chmod +x "$HOME/.local/bin/hadolint"
