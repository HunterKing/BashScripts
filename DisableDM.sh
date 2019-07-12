#!/bin/bash
BACKUPDIR=./backup
echo "This script requires su to run, because it modifies systemd services."
echo "Backing up display-manager.service"
if [ ! -d "$BACKUPDIR" ]; then
	echo "Creating backup folder"
	mkdir backup
fi
if [ ! -f "$BACKUPDIR/display-manager.service" ]; then
	sudo cp /etc/systemd/system/display-manager.service ~/bin/backup
else
	echo "Backup already exists, proceeding..."
fi
echo "Disabling DM Services"
sudo systemctl disable lightdm
sudo systemctl disable display-manager
echo "Removing display-manager.service"
sudo rm /etc/systemd/system/display-manager.service
echo "Press any key to reboot."
read -n 1 
sudo reboot -h now
