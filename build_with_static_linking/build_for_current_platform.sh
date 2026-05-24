#!/usr/bin/env bash

modeswitchversion=$(cat ../modeswitchversion.txt)

# Script to install usb-modeswitch on macOS

# Check for Homebrew and install if not present
if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew not found. Installing...";
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
fi; 

brew install libusb pkg-config; 

if ! [ -d "../usb-modeswitch-${modeswitchversion}" ]; then
    echo "usb-modeswitch-${modeswitchversion} directory does not exist. Fetching and extracting usb-modeswitch-${modeswitchversion}"
    cd ..
    curl -LO "https://www.draisberghof.de/usb_modeswitch/usb-modeswitch-${modeswitchversion}.tar.bz2"
    tar -xjf "usb-modeswitch-${modeswitchversion}.tar.bz2"
    cd ./build_with_static_linking
else
    echo "usb-modeswitch-${modeswitchversion} directory already exists. Skipping fetch and extract."
fi

cp ./Makefile ../"usb-modeswitch-${modeswitchversion}"/Makefile
cd ../"usb-modeswitch-${modeswitchversion}"

make all-static 1> install.log 2>&1 || { echo "Check install_arm.log for details of building."; exit 1; }
echo "usb-modeswitch building for current platform complete. Check your usb-modeswitch-${modeswitchversion} folder."

cp ./usb_modeswitch-current ../