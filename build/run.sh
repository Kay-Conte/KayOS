#!/bin/bash

echo "Running virtual machine"

qemu-system-x86_64 -nographic ../output/boot.bin

echo "Closed"
