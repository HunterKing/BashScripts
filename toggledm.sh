#!/bin/bash
SOURCEFILE=/etc/systemd/system/display-manager.service
BACKUPFILE=./backup/display-manager.service
if [ -f $SOURCEFILE ]; then
	if [ ! -d ./backup ]; then
		mkdir backup
	fi
	if [ ! -f $BACKUPFILE ]; then
		sudo cp $SOURCEFILE $BACKUPFILE
	fi
	sudo systemctl disable lightdm
	sudo systemctl disable display-manager
	sudo rm $SOURCEFILE
	sudo reboot -h now
else
	sudo cp $BACKUPFILE $SOURCEFILE
	sudo systemctl enable lightdm
	sudo systemctl enable display-manager
	sudo reboot -h no
fi
