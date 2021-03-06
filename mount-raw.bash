losetup /dev/loop0 fai-faiserver-buster64.raw
# fdisk -l /dev/loop0 
# apt install kpartx
kpartx -av /dev/loop0
# mount -o ro /dev/mapper/loop0p1 /mnt
# umount /mnt
mount -o ro /dev/mapper/loop0p7 /mnt
# umount /mnt
