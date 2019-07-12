#!/bin/bash
BACKUPDIR=./backup
clear
echo "This script requires su to run, because it modifies systemd services."
echo "Restoring display-manager.service"
if [ ! -d "$BACKUPDIR" ]; then
	echo "backup directory does not exist, quitting..."
	break
fi
if [ ! -f "$BACKUPDIR/display-manager.service" ]; then
	echo "no backup exists, quitting..."
	break
fi
sudo cp ~/bin/backup/display-manager.service /etc/systemd/system/display-manager.service
echo "Re-Enabling Services"
sudo systemctl enable lightdm
sudo systemctl enable display-manager
echo "Press any key to reboot"
read -n 1
sudo reboot -h now
