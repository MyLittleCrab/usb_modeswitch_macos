#!/usr/bin/env bash

#if directory libusb exists, no need to fetch and extract
if ! [ -d "./libusb" ]; then
    echo "libusb directory does not exist. Fetching and extracting libusb for ARM architecture..."
    brew fetch --force --arch=arm libusb
    cp $(brew --cache)/libusb-* .

    tar -xvf libusb-*

else
    echo "libusb directory already exists. Skipping fetch and extract."
fi

if ! [ -d "../usb-modeswitch-2.6.0" ]; then
    echo "usb-modeswitch-2.6.0 directory does not exist. Fetching and extracting usb-modeswitch-2.6.0"
    cd ..
    curl -LO https://www.draisberghof.de/usb_modeswitch/usb-modeswitch-2.6.0.tar.bz2
    tar -xjf usb-modeswitch-2.6.0.tar.bz2
    rm -rf ./usb-modeswitch-2.6.0.tar.bz2;
    cd ./build_with_static_linking
else
    echo "usb-modeswitch-2.6.0 directory already exists. Skipping fetch and extract."
fi

cp ./Makefile ../usb-modeswitch-2.6.0/Makefile
cd ../usb-modeswitch-2.6.0

make all-static-arm 1> install_arm.log 2>&1 || { echo "Check install_arm.log for details of building."; exit 1; }
echo "usb-modeswitch building for ARM complete. Check your usb-modeswitch-2.6.0 folder."
