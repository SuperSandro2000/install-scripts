#!/bin/bash
set -e

# install all my default programs I like to use
for f in programs/*.sh; do
  bash "$f" -H
done

# random utils
sudo apt install -qy curl git git-extras gpg htop mailutils tree unzip zip

# expand cron path
(crontab -l 2>/dev/null; echo -e "SHELL=/bin/bash\nPATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin")| crontab -
(sudo crontab -l 2>/dev/null; echo -e "SHELL=/bin/bash\nPATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin")| sudo crontab -

# reload local bin folder and terminal
# shellcheck disable=1090
source "$HOME/.profile"
# shellcheck disable=1090
source "$HOME/.bashrc"
