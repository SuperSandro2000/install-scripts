#!/bin/bash
set -eoux pipefail

if [[ ${1:-} == "" ]]; then
  ADD_USER="${USER:-}"
else
  ADD_USER="$1"
fi

if [[ $(whoami) != root ]]; then
  if [[ $0 == "bash" ]]; then
    echo "If you directly download and pipe this script you need to start the shell with sudo."
  else
    sudo su -s "$0" root "$ADD_USER"
  fi
  exit
fi

# purge old docker packages, recommended by docker-ce install guide
apt-get remove -qy --purge docker docker-engine docker.io containerd runc || true

apt-get install --no-install-recommends -qy ca-certificates lsb-release wget

wget https://get.docker.com -O- | sh

# python3-cryptography is installed do avoid compiling it on older systems which would require rust.
# --prefer-binary is not an option because older pips do not support it
apt-get install --no-install-recommends -qy python3-cryptography python3-pip python3-setuptools python3-wheel
pip3 install -U docker-compose
mkdir -p /etc/bash_completion.d
wget https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/bash/docker-compose -O /etc/bash_completion.d/docker-compose
groupadd -f docker
# Adding a user to the docker group is equivalent to setting sudo to NOPASSWD.
# Use at your own risk. Not recommended for production. Left here as a note.
# usermod -aG docker "$ADD_USER"
