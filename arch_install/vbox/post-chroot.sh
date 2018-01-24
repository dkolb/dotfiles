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

echo "root:changemeplease" > chpasswd
chage -d 0 root
