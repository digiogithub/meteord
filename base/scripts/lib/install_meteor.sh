set -e

curl -sL https://install.meteor.com -k | sed s/--progress-bar/-sL/g | /bin/sh
