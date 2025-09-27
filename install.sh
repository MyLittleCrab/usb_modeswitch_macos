#!/usr/bin/env bash
# Script to install usb-modeswitch on macOS

# Check for Homebrew and install if not present
if ! command -v brew >/dev/null 2>&1; then \
    echo "Homebrew not found. Installing..."; \
    /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
fi; 

# Install dependencies
brew install libusb pkg-config; 

cd ~;

# Download and install usb-modeswitch
# Link can be changed to the latest version from https://www.draisberghof.de/usb_modeswitch/
curl -LO https://www.draisberghof.de/usb_modeswitch/usb-modeswitch-2.6.0.tar.bz2;
tar -xjf usb-modeswitch-2.6.0.tar.bz2;

# Clean up
rm -rf ./usb-modeswitch-2.6.0.tar.bz2;

cd usb-modeswitch-2.6.0;

echo "All dependencies installed.";

make install 1> install.log 2>&1 || { echo "Check install.log for details of building."; }
echo "usb-modeswitch building complete. Check your home directory for the usb-modeswitch-2.6.0 folder.";

echo "You can add new configuration manually or find existing ones at https://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-20191128.tar.bz2 .";
