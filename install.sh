#!/usr/bin/env sh
set -eu

# Make backup
sudo cp -an /etc/default/grub /etc/default/grub.bak

sudo mkdir -p /usr/share/grub/themes/

git clone https://github.com/Se7endAY/grub2-theme-vimix Vimix
sudo mv Vimix /usr/share/grub/themes/

grep "GRUB_THEME=" /etc/default/grub 2>&1 >/dev/null && sudo sed -i '/GRUB_THEME=/d' /etc/default/grub
sudo echo "GRUB_THEME=\"/usr/share/grub/themes/Vimix/theme.txt\"" >> /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
