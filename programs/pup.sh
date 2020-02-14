#!/bin/bash
set -eoux pipefail

pup=0.4.0

if [[ $(id -u) != 0 ]]; then
  sudo=sudo
else
  sudo=
fi

$sudo apt-get install --no-install-recommends -qy ca-certificates unzip wget
wget "https://github.com/ericchiang/pup/releases/download/v$pup/pup_v${pup}_linux_amd64.zip"
echo "ec3d29e9fb375b87ac492c8b546ad6be84b0c0b49dab7ff4c6b582eac71ba01c *pup_v${pup}_linux_amd64.zip" | sha256sum -c -
unzip "pup_v${pup}_linux_amd64.zip"
rm "pup_v${pup}_linux_amd64.zip"
#mv pup "$HOME/.local/bin/"
$sudo mv pup /usr/local/bin/
