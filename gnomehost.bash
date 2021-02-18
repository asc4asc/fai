#!/bin/bash
# works fine. 
# for networking use dhclient to get a ip address 

sudo apt install qemu-utils bridge-utils qemu-kvm qemu-system-gui

# INET="enp8s0" # better probe for interface to the internet (default gw?) 
# INET="enx00e04c68353b" # usb geht nicht in bridge!
# INET=" wlp6s0 " #wlan geht nicht mit bridge!
# INET="enp4s0" # SC5 Port unten  
INET="enp0s31f6" # SC5 Port oben

USERNAME="demo"
GROUPNAME="demo"
USERNAME="$USER"
GROUPNAME="$USER" # not correct but ....
COMPHOSTNAME="gnomehost"
COMPFILENAME="fai-$COMPHOSTNAME-buster64.raw"
cl='AMD64,DHCPC,FAIBASE,DEBIAN,BUSTER64,DEMO,EASYTEST,XORG,GNOME,GRUB_PC' # Fai Classen fuer diesen Host.

sudo mkdir -p /srv/fai
sudo rm -r /srv/fai/config
sudo cp -ar config/ /srv/fai/

if [ -f /srv/fai/config/basfile/BUSTER* ];
then
  echo vorhanden
else 
  sudo /srv/fai/config/basefiles/mk-basefile -d . BUSTER64
  sudo cp BUSTER* /srv/fai/config/basefiles/ 
  sudo rm BUSTER*
fi
sudo fai-diskimage -v -S7G --hostname $COMPHOSTNAME -c$cl $COMPFILENAME
sudo chown $USERNAME.$GROUPNAME $COMPFILENAME

ping -c 1 google.com || exit 1
ip addr|grep $INET || exit 1
sudo brctl show |grep tap1 >/dev/null || sudo fai-mk-network -P -i $INET $USERNAME
fai-kvm disk $COMPFILENAME 

