set -e
set -x

# Date sync
timedatectl set-ntp true

# Partitioning
parted /dev/sda --script mklabel gpt
parted /dev/sda --script mkpart primary 0% 256MiB
parted /dev/sda --script set 1 boot on
parted /dev/sda --script mkpart 256MiB 100%
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
parted /dev/sda --script print

# Bootstrapping
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt base connman systemd-boot-pacman-hook
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot and post-chroot changes.
wget -O /mnt/root/postchroot.sh 'https://raw.githubusercontent.com/dkolb/dotfiles_v2/master/arch_install/vbox/post-chroot.sh'
chmod +x /mnt/root/postchroot.sh
arch-chroot /mnt /root/postchroot.sh

rm /mnt/root/postchroot.sh

eject -F -m

reboot
