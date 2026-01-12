#!/bin/bash
# Host setup script for bot-sojourner

echo "Setting up host-side dependencies for bot-sojourner..."

# 1. Install RealSense udev rules
echo "Installing RealSense udev rules..."
if [ ! -f /etc/udev/rules.d/99-realsense-libusb.rules ]; then
    sudo curl -sSL https://raw.githubusercontent.com/IntelRealSense/librealsense/master/config/99-realsense-libusb.rules -o /etc/udev/rules.d/99-realsense-libusb.rules
    sudo udevadm control --reload-rules && sudo udevadm trigger
    echo "RealSense udev rules installed."
else
    echo "RealSense udev rules already exist."
fi

# 2. Check for NVIDIA Container Toolkit
echo "Checking for NVIDIA Container Toolkit..."
if command -v nvidia-container-runtime &> /dev/null; then
    echo "NVIDIA Container Toolkit is installed."
else
    echo "WARNING: NVIDIA Container Toolkit not found. Please install it to use GPU acceleration."
    echo "See: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html"
fi

# 3. Network configuration note
echo "NOTE: This project is configured to use 'wlP7p1s0' for CycloneDDS."
echo "If your interface name is different, update 'config/cyclonedds.xml'."

echo "Host setup complete."
