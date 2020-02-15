#!/bin/bash
set -eoux pipefail

if [[ $(id -u) != 0 ]]; then
  sudo=sudo
else
  sudo=
fi

$sudo apt-get install --no-install-recommends -qy bzip2 gcc git libc6-dev make ruby-bundler ruby-dev
mkdir -p "$HOME/src" && cd "$HOME/src/"

git clone https://github.com/travis-ci/travis-build.git || (cd travis-build && git fetch origin && git reset --hard origin/master)
cd travis-build
bundler update travis
bundler binstub travis --force
