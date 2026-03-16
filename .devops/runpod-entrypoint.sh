#!/bin/bash
# RunPod entrypoint — injects PUBLIC_KEY, starts sshd, sleeps

# Inject RunPod SSH public key
mkdir -p /root/.ssh
chmod 700 /root/.ssh
if [ -n "$PUBLIC_KEY" ]; then
    echo "$PUBLIC_KEY" > /root/.ssh/authorized_keys
    chmod 600 /root/.ssh/authorized_keys
fi

# Start SSH daemon
/usr/sbin/sshd

# Keep container alive
exec sleep infinity
