#!/bin/bash
set -eoux pipefail

version=1.1.0
file=git-interactive-rebase-tool_${version}_amd64.deb

trap 'rm $file' EXIT

sudo apt-get install --no-install-recommends -qy git wget
wget https://github.com/MitMaro/git-interactive-rebase-tool/releases/download/$version/$file
sudo apt-get install --no-install-recommends -qy ./$file
git config --global sequence.editor interactive-rebase-tool
