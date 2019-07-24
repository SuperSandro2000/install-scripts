#!/bin/bash
set -eoux pipefail

scrcpy=1.9

# runtime deps
sudo apt-get install -qy ffmpeg libsdl2-2.0-0
# build deps
sudo apt-get install -qy build-essential fastjar git libavformat-dev libsdl2-dev meson ninja-build pkg-config wget
mkdir -p "$HOME/src" && cd "$HOME/src/"
git clone https://github.com/Genymobile/scrcpy.git
wget "https://github.com/Genymobile/scrcpy/releases/download/v$scrcpy/scrcpy-server-v$scrcpy.jar"
echo "ad7e539f100e48259b646f26982bc63e0a60a81ac87ae135e242855bef69bd1a *scrcpy-server-v$scrcpy.jar" | sha256sum -c -
meson x --buildtype release --strip -Db_lto=true "-Dprebuilt_server=scrcpy-server-v$scrcpy.jar"
cd x
ninja
sudo ninja install
