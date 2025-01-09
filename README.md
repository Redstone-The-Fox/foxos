# FoxOS
The worlds worst operating system

Instructions:
`sudo apt install make qemu-system` or `sudo pacman -S make qemu` - Installs make and a virtual machine for running the OS, you can use VirtualBox or VMWare

`make` - Assembles the OS
`qemu-system-i386 -fda build/main_floppy.img` - Lauches QEMU with the IMG file that was assembled