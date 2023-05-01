#!/bin/sh
set -e

# Get env vars in the Dockerfile to show up in the SSH session
eval $(printenv | sed -n "s/^\([^=]\+\)=\(.*\)$/export \1=\2/p" | sed 's/"/\\\"/g' | sed '/=/s//="/' | sed 's/$/"/' >> /etc/profile)

# Background threads
echo "Start SSH..."
/usr/sbin/sshd

echo "Start nginx..."
nginx -g 'daemon off;'

# Foreground threads
# exec /usr/sbin/sshd -D -e "$@"