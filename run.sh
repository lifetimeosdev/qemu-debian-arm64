#!/bin/bash

set -ex

qemu-system-aarch64 \
  -m 8G \
  -machine type=virt,gic-version=3,iommu=smmuv3 \
  -cpu max \
  -smp 28 \
  -initrd "./initrd.img-from-guest" \
  -kernel "./vmlinuz-from-guest" \
  -append "console=ttyAMA0 root=/dev/vda2" \
  -drive if=virtio,file=disk.qcow2,format=qcow2 \
  -netdev user,id=net0,hostfwd=tcp::2201-:22 \
    -device virtio-net-device,netdev=net0 \
  -rtc base=localtime,clock=host \
  -nographic
