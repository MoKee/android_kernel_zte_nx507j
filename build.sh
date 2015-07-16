#!/bin/bash

export ARCH=arm
export CROSS_COMPILE="/home/ultimatum163/AK-linaro/4.9.3-2015.03.15/bin/arm-cortex_a15-linux-gnueabihf-"


make msm8974-NX507J_defconfig
make -j4

make INSTALL_MOD_STRIP=--strip-unneeded INSTALL_MOD_PATH=out/system INSTALL_MOD_DIR=out/system android_modules_install

./dtbToolCM --force-v2 -o ./out/dt.img -s 2048 -p ./scripts/dtc/ ./arch/arm/boot/

cp ./arch/arm/boot/zImage ./out/zImage

