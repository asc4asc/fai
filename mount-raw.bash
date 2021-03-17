# Mount fai FAIBASE raw image CSM 

losetup /dev/loop0 fai-faiserver-buster64.raw
# fdisk -l /dev/loop0 
# apt install kpartx
kpartx -av /dev/loop0
mkdir -p /target/home
mount -o ro /dev/mapper/loop0p1 /target
mount -o ro /dev/mapper/loop0p7 /target/home
