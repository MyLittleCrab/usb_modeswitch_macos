#!/usr/bin/env bash

brew install libusb pkg-config; 

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

make all-static 1> install.log 2>&1 || { echo "Check install_arm.log for details of building."; exit 1; }
echo "usb-modeswitch building for current platform complete. Check your usb-modeswitch-2.6.0 folder."
