#!/bin/bash -
set -e

# Copy template for config file if not already present
mkdir -p /etc/automatic/update-docker-images
cp -nv images.conf /etc/automatic/update-docker-images/

# Copy execution script to /usr/local/bin
cp -v update-docker-images.sh /usr/local/bin/update-docker-images
chmod +x /usr/local/bin/update-docker-images

# Install and activate the systemd units
cp -v update-docker-images.service update-docker-images.timer /etc/systemd/system/
systemctl daemon-reload
systemctl start update-docker-images.timer
systemctl enable update-docker-images.timer
