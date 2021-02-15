# fai
Neuer Versuch fai config files

New Ideas:
```
Debian 10 per faime installiert dann. fai pakete installiert.

git clone https://github.com/asc4asc/fai.config.git # config nach /srv/fai copieren.

sudo su
export FAI_BASEFILEURL=https://fai-project.org/download/basefiles/ # funktioniert nicht musste basefile selbst erzeugen/downloaden. 

cl='AMD64,FAIBASE,DEBIAN,BUSTER64,DEMO,GRUB_PC' && fai-diskimage -v -S5G --hostname demohost -c$cl fai-demohost-buster64.qcow2
chown demo.demo fai-server-buster64.qcow2
fai-mk-network -P -i <lan> demo 
# end sudo
fai-kvm disk fai-demohost-buster64.qcow2

---------------- Fai Server -------------------

export FAI_BASEFILEURL=https://fai-project.org/download/basefiles/ # funktioniert nicht musste basefile selbst erzeugen/downloaden. 
/tmp filesystem nicht in fstab extra mounten. cd /srv/fai/config/basefiles ; ./mk.... -J BUSTER64  

cl='AMD64,FAIBASE,DEBIAN,BUSTER64,DEMO,FAISERVER,GRUB_PC'
sudo fai-diskimage -v -S10G --hostname faiserver -c$cl fai-server-buster64.qcow2
sudo chown debian.debian fai-server-buster64.qcow2
sudo fai-mk-network -i wlp6s0 demo #-P?
fai-kvm disk fai-server-buster64.qcow2

fai-kvm -NVn -u 2 pxe # Test Installation

fai-kvm -u 2 disk /tmp/faitest-disk-2-1.qcow2 # Test des Tests :-)

fai-me: Zusatzpakete: kvm git cockpit cockpit-maschines / fai-? / Password fai / User demo
```
