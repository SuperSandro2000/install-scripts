#!/bin/bash
set -eoux pipefail

scrcpy=1.11

# runtime deps
sudo apt-get install -qy ffmpeg libsdl2-2.0-0
# build deps
sudo apt-get install -qy build-essential fastjar git libavformat-dev libsdl2-dev meson ninja-build pkg-config wget
mkdir -p "$HOME/src" && cd "$HOME/src/"
git clone https://github.com/Genymobile/scrcpy.git || (cd scrcpy && git fetch origin && git reset --hard origin/master)
cd scrcpy
git checkout v$scrcpy
wget "https://github.com/Genymobile/scrcpy/releases/download/v$scrcpy/scrcpy-server-v$scrcpy"
echo "ff3a454012e91d9185cfe8ca7691cea16c43a7dcc08e92fa47ab9f0ea675abd1 *scrcpy-server-v$scrcpy" | sha256sum -c -
meson x --buildtype release --strip -Db_lto=true "-Dprebuilt_server=scrcpy-server-v$scrcpy"
cd x
ninja
sudo ninja install
