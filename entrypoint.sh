#!/bin/sh

# Background threads
echo "Start SSH..."
/usr/sbin/sshd

echo "Start nginx..."
nginx -g 'daemon off;'

# Foreground threads
# exec /usr/sbin/sshd -D -e "$@"