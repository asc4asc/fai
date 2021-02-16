#!/bin/bash
sudo apt install qemu-utils bridge-utils qemu-kvm qemu-system-gui

ping -c 1 google.com || exit 1
INET="enp8s0" # better probe for interface to the internet (default gw?) 

USERNAME="demo"
GROUPNAME="demo"
USERNAME="$USER"
GROUPNAME="$USER" # not correct but ....
COMPFILENAME="fai-demohost-buster64.qcow2"

sudo mkdir /srv/fai
sudo cp -ar config/ /srv/fai/
sudo /srv/fai/config/basefiles/mk-basefile -d . BUSTER64
sudo cp BUSTER* /srv/fai/config/basefiles/ 
cl='AMD64,FAIBASE,DEBIAN,BUSTER64,DEMO,GRUB_PC'
sudo fai-diskimage -v -S10G --hostname demohost -c$cl $COMPFILENAME
sudo chown $USERNAME.$GROUPNAME $COMPFILENAME
sudo fai-mk-network -P -i $INET $USERNAME
fai-kvm disk $COMPFILENAME
