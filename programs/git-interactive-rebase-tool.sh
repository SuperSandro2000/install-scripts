#!/bin/bash
set -eoux pipefail

version=1.1.0
file=git-interactive-rebase-tool_${version}_amd64.deb

sudo apt-get install -qy libncursesw5 wget
wget https://github.com/MitMaro/git-interactive-rebase-tool/releases/download/$version/$file
sudo apt-get install ./$file
rm $file
git config --global sequence.editor interactive-rebase-tool
