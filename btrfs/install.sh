#!/bin/bash -
set -e

# Install and activate the systemd units
cp -v btrfs-scrub@.service btrfs-scrub@.timer /etc/systemd/system/
systemctl daemon-reload
echo "Use `systemctl enable btrfs-scrub@-.timer` to enable srubbing for the root volumne"

