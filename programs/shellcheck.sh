#!/bin/bash
set -eoux pipefail

file="shellcheck-stable.linux.x86_64.tar.xz"

trap 'rm $file' EXIT

if [[ $(id -u) != 0 ]]; then
  sudo=sudo
else
  sudo=
fi

$sudo apt-get install --no-install-recommends -qy ca-certificates tar xz-utils wget
wget https://storage.googleapis.com/shellcheck/$file
tar -xf $file
$sudo mv shellcheck-stable/shellcheck /usr/bin/shellcheck
rm -r shellcheck-stable
