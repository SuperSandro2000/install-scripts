#!/bin/bash
set -eoux pipefail

sudo apt-get install -qy unzip wget
wget https://rclone.org/install.sh -O- | sudo bash
