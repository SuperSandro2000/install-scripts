#!/bin/bash
set -eoux pipefail

sudo apt-get install --no-install-recommends -qy ca-certificates curl unzip
curl https://rclone.org/install.sh -o- | sudo bash
