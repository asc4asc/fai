#!/bin/bash
sudo apt install qemu-utils bridge-utils qemu-kvm qemu-system-gui

ping -c 1 google.com || exit 1
# INET="enp8s0" # better probe for interface to the internet (default gw?) 
# INET="enx00e04c68353b" # 
# INET=" wlp6s0 " # Wlan laptop
# INET="enp4s0" # SC5 Port unten  
INET="enp0s31f6" # SC5 Port oben

USERNAME="demo"
GROUPNAME="demo"
USERNAME="$USER"
GROUPNAME="$USER" # not correct but ....
COMPHOSTNAME="faiserver"
COMPFILENAME="fai-$COMPHOSTNAME-buster64.raw"


sudo mkdir -p /srv/fai
sudo rm -r /srv/fai/config
sudo cp -ar config/ /srv/fai/

if [ -f /srv/fai/config/basefile/BUSTER* ];
then
  echo vorhanden
else 
  [ -f BUSTER* ] || sudo /srv/fai/config/basefiles/mk-basefile -d . BUSTER64
  sudo cp BUSTER* /srv/fai/config/basefiles/ 
  # sudo rm BUSTER*
fi

cl='AMD64,FAIBASE,DEBIAN,BUSTER64,DEMO,FAISERVER,EASYTEST,GRUB_PC'
sudo fai-diskimage -v -S10G --hostname faiserver -c$cl $COMPFILENAME
sudo chown $USERNAME.$GROUPNAME $COMPFILENAME

ping -c 1 google.com || exit 1
ip addr|grep $INET || exit 1
sudo brctl show |grep tap1 >/dev/null || sudo fai-mk-network -i $INET $USERNAME
fai-kvm disk $COMPFILENAME &

echo "Please wait for faiserver is ready!" 
read 
fai-kvm -NVn -u 2 pxe & # Test Installation
echo "Next Client?" 
read 
fai-kvm -NVn -u 3 pxe & # Test Installation
echo "Next Client?"
read 
fai-kvm -NVn -u 4 pxe & # Test Installation
echo "Next Client?"
read 
fai-kvm -NVn -u 5 pxe & # Test Installation
echo "Next Client?"
read 
fai-kvm -NVn -u 6 pxe & # Test Installation
read 


