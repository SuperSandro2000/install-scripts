#!/bin/bash
set -eoux pipefail

version=0.3.5
file=mcfly-v$version-x86_64-unknown-linux-gnu.tar.gz

sudo apt-get install -qy tar wget
wget "https://github.com/cantino/mcfly/releases/download/v$version/$file"
tar xf "$file"
rm "$file"
mv mcfly "$HOME/.local/bin/"
mv mcfly.bash "$HOME/.local/"

if grep "mcfly.bash" "$HOME/.bashrc"; then
  tee -a "$HOME/.bashrc" <<EOF

if [[ -r $HOME/.local/mcfly.bash ]]; then
  source "$HOME/.local/mcfly.bash"
fi"
EOF
fi
