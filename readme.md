# Debian Updater
This script is designed for CloudAtCost to update their old templates automagically to the newest version of debian

## Boot Script 
This is the script that you can add directly to a VM that can automatically kick off the process of updating everything. This can be copied into the CAC boot script panel and it will download the repo and create everything needed to run the script on boot. 

## Unattended Upgrades 
This script configures automatic updates with reboots for updates needed

## Version Updator
This script is the logic to actually update the host. 