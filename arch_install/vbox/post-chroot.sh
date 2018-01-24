set -e
set -x

#Time zone
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc

#Locale
sed -i.bak -re 's/#(en_US.UTF-8.*)/\1/' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

#Host name
echo dkub-arch-vbox > /etc/hostname

#Root pass
echo "root:changemeplease" > chpasswd
chage -d 0 root

#Bootloader
bootctl --path=/boot install
cp /usr/share/systemd/bootctl/arch.conf /boot/loader/entries/arch.conf

local part_id=$(blkid -s PARTUUID -o value /dev/sda2)
local rootfs_type=ext4

sed -i \
  -e "s/options.*/options root=PARTUUID=$part_id rootfstype=$rootfs_type add_efi_memmap/" \
  /boot/loader/entries/arch.conf
