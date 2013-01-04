#!/bin/bash

roscd

# Update the AR.Drone Driver
if [ -d "ardrone_autonomy" ];
then
 cd ardrone_autonomy
 git pull
 ./build_sdk.sh
else
 git clone https://github.com/AutonomyLab/ardrone_autonomy.git
 cd ardrone_autonomy
 ./build_sdk.sh
fi

roscd
# Update the first tutorial's files
if [ -d "ardrone_tutorials_getting_started" ];
then
 cd ardrone_tutorials_getting_started
 git pull
else
 git clone https://github.com/mikehamer/ardrone_tutorials_getting_started.git
fi

roscd
# This will download an install file for new tutorials, which is then run.
# We do it this way so that we can update the install file and run it straight away,
# instead of having to run the update procedure twice (which we would need to do if this file were updated)
if [ -f "ardrone_tutorials_getting_started/install_new_tutorials.sh" ];
then
 cd ardrone_tutorials_getting_started
 source install_new_tutorials.sh
fi

roscd

rospack profile
rosstack profile

rosmake -a

read -p "Update complete. Press [Enter] to continue."