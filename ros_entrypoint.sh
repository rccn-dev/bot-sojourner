#!/bin/bash
set -e

# Setup ROS 2 environment
source "/opt/ros/humble/setup.bash"

# Configure CycloneDDS
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export CYCLONEDDS_URI=file:///workspaces/bot-sojourner/config/cyclonedds.xml

# Source workspace if it exists
if [ -f "/workspaces/bot-sojourner/install/setup.bash" ]; then
    source "/workspaces/bot-sojourner/install/setup.bash"
fi

# Execute the command passed to this script
exec "$@"
