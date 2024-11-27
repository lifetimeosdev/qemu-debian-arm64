## qemu-debian-arm64
Run debian arm64 on x86-64 host

## Command

```bash
qemu-img create -f qcow2 disk.qcow2 100G

curl -O http://ftp.us.debian.org/debian/dists/stable/main/installer-arm64/current/images/cdrom/initrd.gz
curl -O http://ftp.us.debian.org/debian/dists/stable/main/installer-arm64/current/images/cdrom/vmlinuz
curl -O -L https://cdimage.debian.org/debian-cd/current/arm64/iso-dvd/debian-12.8.0-arm64-DVD-1.iso

# After installation
./copy_out_vmlinuz_initrd.sh

```
## Important
- You should use `copy_out_vmlinuz_initrd.sh` script to copy out kernel and initrd after linux upgrade in debian guest.
- `ping` command is not work when using `net-dev user`. You shold use `wget google.com` or `curl google.com` to test network. Refer to: https://wiki.qemu.org/Documentation/Networking

## Exit qemu
Press `ctrl a` and release the keys then press `x`

## Debian installer switch TAB (screen)
press `ctrl a` and release then press `ctrl a` and release then press `1` or `2` or `3` or `4` to switch tab

## Thanks to Will Haley
https://www.willhaley.com/blog/debian-arm-qemu/

## Thanks to KJ7LNW
https://unix.stackexchange.com/questions/533539/switch-tabs-in-debian-installer-over-serial-console-with-putty
