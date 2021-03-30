#!/usr/bin/env sh
set -eu

[ "$(id -u)" -ne 0 ] && echo "Run as root" && exit 1
# Make backup
cp -an /etc/default/grub /etc/default/grub.bak
mkdir -p /usr/share/grub/themes/

git clone https://github.com/Se7endAY/grub2-theme-vimix Vimix
mv Vimix /usr/share/grub/themes/

grep "GRUB_THEME=" /etc/default/grub 2>&1 >/dev/null && sudo sed -i '/GRUB_THEME=/d' /etc/default/grub
echo "GRUB_THEME=\"/usr/share/grub/themes/Vimix/theme.txt\"" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
