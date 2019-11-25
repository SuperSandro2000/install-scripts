#!/bin/bash
set -eoux pipefail

if [[ ${1:-} == "" ]]; then
  ADD_USER="${USER:-}"
else
  ADD_USER="$1"
fi

if [[ $(whoami) != root ]]; then
  sudo su -s "$0" root "$ADD_USER"
  exit
fi

docker_compose=1.24.1

# purge old docker packages, recommended by docker-ce install guide
apt-get remove -qy --purge docker docker-engine docker.io containerd runc

apt-get install -qy wget

source /etc/os-release

# there is no dist for eoan yet, so we fall back to disco
if [[ $VERSION_CODENAME == eoan ]]; then
  echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu disco stable test" >/etc/apt/sources.list.d/docker.list
  apt-get install -qy apt-transport-https gnupg
  wget -q https://download.docker.com/linux/ubuntu/gpg -O- | apt-key add -
  apt-get update
  apt-get install -qy docker-ce
else
  wget https://get.docker.com -O- | sh
fi

apt-get install -qy python3-setuptools python3-pip
pip3 install -U docker-compose wheel
mkdir -p /etc/bash_completion.d
wget https://raw.githubusercontent.com/docker/compose/$docker_compose/contrib/completion/bash/docker-compose -O /etc/bash_completion.d/docker-compose
groupadd -f docker
# Adding a user to the docker group is equivalent to setting sudo to NOPASSWD.
# Use at your own risk. Not recommended for production. Left here as a note.
# usermod -aG docker "$ADD_USER"
