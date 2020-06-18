#!/bin/bash

kernel_ver="$1"
pkg_version="$2"

rm *.deb
rm *.changes

cd linux-source-$kernel_ver
cp  ../configs/custom-config-$kernel_ver .config
echo "$pkg_version" > .version
make oldconfig ARCH=arm
make -j10 ARCH=arm KBUILD_DEBARCH=armhf CROSS_COMPILE="arm-linux-gnueabihf-" bindeb-pkg