#!/bin/bash
set -eoux pipefail

if [[ $(id -u) != 0 ]]; then
  sudo=sudo
else
  sudo=
fi

$sudo apt-get install --no-install-recommends -qy apt-transport-https curl gnupg lsb-release
code_name=$(lsb_release -sc)
cat << EOF > /etc/apt/sources.list.d/gitlab-runner.list
deb https://packages.gitlab.com/runner/gitlab-runner/ubuntu/ $code_name main
deb-src https://packages.gitlab.com/runner/gitlab-runner/ubuntu/ $code_name main
EOF
curl -L https://packages.gitlab.com/runner/gitlab-runner/gpgkey | apt-key add -
apt-get update
apt-get install --no-install-recommends -qy gitlab-runner
