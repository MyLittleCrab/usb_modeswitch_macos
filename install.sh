#!/usr/bin/env bash
# Script to install usb-modeswitch on macOS

set -e

# Check for Homebrew and install if not present
if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew not found. Installing...";
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
fi; 

# Install dependencies
brew install libusb pkg-config; 

cd ~;

# Download and install usb-modeswitch
# Link can be changed to the latest version from https://www.draisberghof.de/usb_modeswitch/
curl -LO https://www.draisberghof.de/usb_modeswitch/usb-modeswitch-2.6.0.tar.bz2;
tar -xjf usb-modeswitch-2.6.0.tar.bz2;
cd usb-modeswitch-2.6.0;
make install;

# Clean up
rm -rf ../usb-modeswitch-2.6.0.tar.bz2;


echo "usb-modeswitch installation completed.";

echo "You can add new configuration manually or find existing ones at https://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-20191128.tar.bz2 .";
