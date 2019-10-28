#!/bin/bash

apt-get clean
apt -y update
apt -y upgrade

# Update to the latest kernel
apt-get install -y linux-generic linux-image-generic linux-server

# Hide Ubuntu splash screen during OS Boot, so you can see if the boot hangs
apt-get remove -y plymouth-theme-ubuntu-text
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT=""/' /etc/default/grub
update-grub

# Install base packages
apt-get install -y wget -q  unzip git curl net-tools tar gawk tcpdump netcat sshpass jq vim

# Reboot with the new kernel
shutdown -r now
sleep 60

exit 0

