#!/bin/bash

CONFIG_FILE="/etc/automatic/update-docker-images/images.conf"
set -e

for image in `grep -v '#' ${CONFIG_FILE}`; do
	echo "-----------------------------------"
	echo "Updating $image:"
	echo "-----------------------------------"
	docker pull "$image"
	echo ""
done

echo "-----------------------------------"
echo "Removing unused images"
echo "-----------------------------------"
docker image prune -f

