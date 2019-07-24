#!/bin/bash
set -eoux pipefail

sudo apt-get install -qy curl
curl https://rclone.org/install.sh | sudo bash
