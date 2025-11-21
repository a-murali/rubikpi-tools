#!/usr/bin/env bash

echo "sourcing /opt/ros/jazzy/setup.bash"
source /opt/ros/jazzy/setup.bash

echo "CDing to $1"
cd "$1"

echo "building ros2 package (no sudo)"
colcon build #--symlink-install

echo "sourcing ./install/setup.bash"
source install/setup.bash

echo "Done."

