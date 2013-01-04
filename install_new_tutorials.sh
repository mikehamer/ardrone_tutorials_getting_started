#!/bin/bash

# first, a fix for the update_tutorials script found in the ARDroneUbuntu VM

roscd ardrone_tutorials_getting_started

if [ -f "/home/ardrone/bin/update_tutorials" ];
then
 echo "Detected ARDroneUbuntu, upgrading update_tutorials script" 
 rm /home/ardrone/bin/update_tutorials
 cp ARDroneUbuntu_Updates/update_tutorials /home/ardrone/bin/update_tutorials
 chmod +x /home/ardrone/bin/update_tutorials
fi

if [ -f "/home/ardrone/bin/ardrone_keyboard_control" ];
then
 echo "Detected ARDroneUbuntu, upgrading ardrone_keyboard_control script" 
 rm /home/ardrone/bin/ardrone_keyboard_control
 cp ARDroneUbuntu_Updates/ardrone_keyboard_control /home/ardrone/bin/ardrone_keyboard_control
 chmod +x /home/ardrone/bin/ardrone_keyboard_control
fi

roscd

# remove the old tutorial structure

if [ -d "ardrone_tutorials_getting_started" ];
then
 rm -rf ardrone_tutorials_getting_started
fi

# install the updated tutorial structure

git clone https://github.com/mikehamer/ardrone_tutorials.git