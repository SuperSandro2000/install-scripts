#!/bin/bash
set -eoux pipefail

version=1.2.1
file=git-interactive-rebase-tool_${version}_amd64.deb

trap 'rm $file' EXIT

if [[ $(id -u) != 0 ]]; then
  sudo=sudo
else
  sudo=
fi

$sudo apt-get install --no-install-recommends -qy git wget
wget https://github.com/MitMaro/git-interactive-rebase-tool/releases/download/$version/$file
$sudo apt-get install --no-install-recommends -qy ./$file
git config --global sequence.editor interactive-rebase-tool
