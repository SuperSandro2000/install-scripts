#!/bin/bash
set -eoux pipefail

scrcpy=1.12.1

# build deps
sudo apt-get install --no-install-recommends -qy ca-certificates gcc git libavformat-dev libsdl2-dev meson pkg-config wget

mkdir -p "$HOME/src" && cd "$HOME/src/"
git clone --depth=1 --branch v$scrcpy https://github.com/Genymobile/scrcpy.git || (cd scrcpy && git fetch origin && git reset --hard origin/master)
cd scrcpy

if [[ ! -f scrcpy-server-v$scrcpy ]]; then
	wget "https://github.com/Genymobile/scrcpy/releases/download/v$scrcpy/scrcpy-server-v$scrcpy"
fi

echo "63e569c8a1d0c1df31d48c4214871c479a601782945fed50c1e61167d78266ea *scrcpy-server-v$scrcpy" | sha256sum -c -
meson x --buildtype release --strip -Db_lto=true "-Dprebuilt_server=scrcpy-server-v$scrcpy"
cd x
ninja
sudo ninja install

# runtime deps
sudo apt-get install --no-install-recommends -qy adb
