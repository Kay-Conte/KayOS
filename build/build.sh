#!/bin/bash

echo "Building bootable binary"

cd ../src/

nasm -f bin ./boot.asm -o ../output/boot.bin

echo "Finished"
