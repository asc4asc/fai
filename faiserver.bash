#!/bin/bash
sudo apt install qemu-utils bridge-utils qemu-kvm qemu-system-gui

ping -c 1 google.com || exit 1
INET="enp8s0" # better probe for interface to the internet (default gw?) 

USERNAME="demo"
GROUPNAME="demo"
USERNAME="$USER"
GROUPNAME="$USER" # not correct but ....

sudo mkdir /srv/fai
sudo cp -ar config/ /srv/fai/
sudo /srv/fai/config/basefiles/mk-basefile -d . BUSTER64
sudo cp BUSTER* /srv/fai/config/basefiles/ 
cl='AMD64,FAIBASE,DEBIAN,BUSTER64,DEMO,FAISERVER,GRUB_PC'
sudo fai-diskimage -v -S10G --hostname faiserver -c$cl fai-server-buster64.qcow2
sudo chown $USERNAME.$GROUPNAME fai-server-buster64.qcow2
sudo fai-mk-network -i $INET $USERNAME
fai-kvm disk fai-server-buster64.qcow2 &
echo "Please wait for faiserver is ready!" 
read 
fai-kvm -NVn -u 2 pxe # Test Installation
