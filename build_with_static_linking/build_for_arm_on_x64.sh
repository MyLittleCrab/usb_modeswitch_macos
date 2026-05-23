#!/usr/bin/env bash

modeswitchversion=$(cat ../modeswitchversion.txt)

# Script to install usb-modeswitch on macOS

# Check for Homebrew and install if not present
if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew not found. Installing...";
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
fi; 

brew install pkg-config; 

#if directory libusb exists, no need to fetch and extract
if ! [ -d "./libusb" ]; then
    echo "libusb directory does not exist. Fetching and extracting libusb for ARM architecture..."
    find $(brew --cache) -name "libusb-*-arm64*" -delete
    brew fetch --force --arch=arm libusb
    cp $(brew --cache)/libusb-* .

    tar -xvf libusb-*

else
    echo "libusb directory already exists. Skipping fetch and extract."
fi

if ! [ -d "../usb-modeswitch-${modeswitchversion}" ]; then
    echo "usb-modeswitch-${modeswitchversion} directory does not exist. Fetching and extracting usb-modeswitch-${modeswitchversion}"
    cd ..
    curl -LO "https://www.draisberghof.de/usb_modeswitch/usb-modeswitch-${modeswitchversion}.tar.bz2"
    tar -xjf "usb-modeswitch-${modeswitchversion}.tar.bz2"
    rm -rf ./"usb-modeswitch-${modeswitchversion}.tar.bz2";
    cd ./build_with_static_linking
else
    echo "usb-modeswitch-${modeswitchversion} directory already exists. Skipping fetch and extract."
fi

cp ./Makefile ../"usb-modeswitch-${modeswitchversion}"/Makefile
cd ../"usb-modeswitch-${modeswitchversion}"

make all-static-arm 1> install_arm.log 2>&1 || { echo "Check install_arm.log for details of building."; exit 1; }
echo "usb-modeswitch building for ARM complete. Check your usb-modeswitch-${modeswitchversion} folder."

cp ./usb_modeswitch-arm64 ../