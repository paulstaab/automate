#!/bin/bash -
set -e

# Copy execution script to /usr/local/bin
cp -v sleep-at-night.sh /usr/local/bin/sleep-at-night
chmod +x /usr/local/bin/sleep-at-night

# Install and activate the systemd units
cp -v sleep-at-night.service sleep-at-night.timer /etc/systemd/system/
systemctl daemon-reload
systemctl start sleep-at-night.timer
systemctl enable sleep-at-night.timer
