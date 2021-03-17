# Mount fai FAIBASE raw image
losetup /dev/loop0 fai-faiserver-buster64.raw
# fdisk -l /dev/loop0 
# apt install kpartx
kpartx -av /dev/loop0
# mount -o ro /dev/mapper/loop0p1 /mnt
# umount /mnt
mkdir -P /target/home
mount -o ro /dev/mapper/loop0p7 /target
mount -o ro /dev/mapper/loop0p7 /target/home
# umount /mnt
