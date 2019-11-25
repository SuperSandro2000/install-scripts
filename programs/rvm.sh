#!/bin/bash
set -eoux pipefail

sudo apt-get install -qy wget gpg
gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
wget https://get.rvm.io -O- | sudo bash -s stable
sudo usermod -aG rvm "${USER:-}"
sudo usermod -aG rvm root
