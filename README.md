# automate
Various small automation tasks for a linux workstation primarily using systemd and docker

## Tasks
- **sleep-at-night**: Suspend the system in the evening once it is idle, and wake it up on the next morning
- **update-docker-images**: Regular, automated updates for a configurable list of docker images 

## Warning
I try to keep task small, simple and for one purpose only. That does not mean that nothing
can go wrong. Use them at our own risk and only if you understand what they are doing.
Do not execute any install script from the internet, particularly not as root, before you 
checked it line by line!

## Installation
You can install the tasks individually by running
```bash
./install.sh
```
within its folder. The scripts usually require root privileges. You will likely have to adapt
them here and there according to your own preferences.
