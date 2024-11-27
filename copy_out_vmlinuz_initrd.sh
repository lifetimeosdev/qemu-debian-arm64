#!/bin/bash

set -exo pipefail

sudo modprobe nbd
sudo qemu-nbd -c /dev/nbd0 ./disk.qcow2
sudo partx -l /dev/nbd0

# mount boot partition
sudo mount /dev/nbd0p1 /mnt/

cp /mnt/vmlinuz ./vmlinuz-from-guest
cp /mnt/initrd.img ./initrd.img-from-guest

sudo umount /mnt
sudo qemu-nbd -d /dev/nbd0
