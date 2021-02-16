#!/bin/bash
sudo apt install qemu-utils bridge-utils qemu-kvm qemu-system-gui

# INET="enp8s0" # better probe for interface to the internet (default gw?) 
INET="enx00e04c68353b" # better probe for interface to the internet (default gw?) 

USERNAME="demo"
GROUPNAME="demo"
USERNAME="$USER"
GROUPNAME="$USER" # not correct but ....
COMPHOSTNAME="demohost"
COMPFILENAME="fai-$(demohost)-buster64.qcow2"
cl='AMD64,FAIBASE,DEBIAN,BUSTER64,DEMO,GRUB_PC' # Fai Classen fuer diesen Host.

sudo mkdir /srv/fai
sudo cp -ar config/ /srv/fai/
sudo /srv/fai/config/basefiles/mk-basefile -d . BUSTER64
sudo cp BUSTER* /srv/fai/config/basefiles/ 
sudo fai-diskimage -v -S10G --hostname $COMPHOSTNAME -c$cl $COMPFILENAME
sudo chown $USERNAME.$GROUPNAME $COMPFILENAME

ping -c 1 google.com || exit 1
ip addr|grep $INET || exit 1
sudo fai-mk-network -P -i $INET $USERNAME
fai-kvm disk $COMPFILENAME
