apt-get install qemu-system-gui qemu-kvm qemu-utils bridge-utils

sudo mkdir /srv/fai
sudo cp -ar config/ /srv/fai/
sudo /srv/fai/config/basefiles/mk-basefile -d . BUSTER64 
cl='AMD64,FAIBASE,DEBIAN,BUSTER64,DEMO,FAISERVER,GRUB_PC'
sudo fai-diskimage -v -S10G --hostname faiserver -c$cl fai-server-buster64.qcow2
sudo chown demo.demo fai-server-buster64.qcow2
sudo fai-mk-network -i enp8s0 demo
fai-kvm disk fai-server-buster64.qcow2
