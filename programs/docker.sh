#!/bin/bash
set -eoux pipefail

if [[ ${1:-} == "" ]]; then
  ADD_USER="$USER"
else
  ADD_USER="$1"
fi

if [[ $(whoami) != root ]]; then
  sudo su -s "$0" root "$ADD_USER"
  exit
fi

apt-get remove -qy docker docker-engine docker.io containerd runc --purge
if [[ $(lsb_release -cs) == disco ]]; then
  echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable test" >/etc/apt/sources.list.d/docker.list
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
  apt-get update
  apt-get install -qy apt-transport-https ca-certificates curl
  apt-get install -qy --no-install-recommends docker-ce
else
  curl -sSL https://get.docker.com | sh
fi

apt-get install -qy curl python3-setuptools python3-pip
pip3 install -U docker-compose wheel
curl -L https://raw.githubusercontent.com/docker/compose/1.24.1/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
groupadd docker -f
# Adding a user to the docker group is equivalent to setting sudo to NOPASSWD.
# Use at your own risk. Not recommended for production. Left here as a note.
# usermod -aG docker "$ADD_USER"
