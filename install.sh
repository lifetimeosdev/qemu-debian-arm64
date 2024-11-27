#!/bin/bash

set -ex

qemu-system-aarch64 \
  -machine type=virt,gic-version=3,iommu=smmuv3 \
  -cpu max \
  -m 8g \
  -smp 28 \
  -initrd "./initrd.gz" \
  -kernel "./vmlinuz" \
  -append "console=ttyAMA0" \
  -drive file=./debian-12.8.0-arm64-DVD-1.iso,id=cdrom,if=none,media=cdrom \
    -device virtio-scsi-device \
    -device scsi-cd,drive=cdrom \
  -drive if=virtio,file=disk.qcow2,format=qcow2 \
  -netdev user,id=net0,hostfwd=tcp::5555-:22 \
    -device virtio-net-device,netdev=net0 \
  -nographic
