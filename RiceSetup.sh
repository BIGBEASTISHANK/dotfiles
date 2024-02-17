#!/bin/sh

## Making build directory
mkdir Build ; cd ./Build

## Installing packages
# Paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../

## Others
paru -S alacritty bspwm sddm dunst fish picom polybar rofi sxhkd --noconfirm
paru -S brave-bin gpick flameshot pcmanfm discord --noconfirm
paru -S xorg-xsetroot xfce4-polkit nitrogen greenclip neovim --noconfirm
paru -S ttf-font-awesome noto-fonts noto-fonts-emoji --noconfirm
paru -S lxappearance qt5ct kvantum --noconfirm

## Setting enviorment variable
sudo sh -c "echo QT_QPA_PLATFORMTHEME=qt5ct >> /etc/environment"

## Setting Neovim
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
sudo git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

## Moving config files
cd ../config/
# Giving right permisison
chmod +x ./alacritty/* ./bspwm/* ./dunst/* ./fish/* ./picom/* ./polybar/* ./rofi/* ./sxhkd/*

# Moving configs
cp -r ./* $HOME/.config/
# Moving wallpaper
cd ../
cp -r ./Wallpaper/ $HOME/Pictures


## Moving Themes
paru -S
cd ./Themes/
sudo cp -r ./Grub\ Theme/* /boot/grub/themes/

echo "Opening grub config file to set theme. Please locate 'GRUB_THEME' and set it's value to (GRUB_THEME='/boot/grub/themes/darkmatter/theme.txt')"

sleep 2
read -p "Press any key to continue..."

sudo nvim /etc/default/grub

# Making grub config again
sudo grub-mkconfig -o /boot/grub/grub.cfg


## SDDM theme
sudo cp -r ./SDDM\ Theme/sugar-candy-custom/
sudo cp ./SDDM\ Theme/sddm.conf /etc/

## System theme
# Kvantum
mkdir $HOME/.config/Kvantum/
cp -r ./System\ Theme/Dracula\ Kvantum/ $HOME/.config/Kvantum/Dracula/
kvantummanager --set Dracula

# Qt5ct
echo "After reboot and login to you bspwm enviorment press (Super + Shift + Return) then type qt5ct and press enter. A application will open and then click on style and change it to kvantum-dark"

read -p "Press any key to continue..."

# System theme (lxappearance)
# Cursor theme
sudo cp -r ./Cursor/* /usr/share/icons/
sudo cp -r ./System\ Theme/Dracula /usr/share/themes/

echo "Opening a theme file please put (Bibata-Rainbow-Modern) value in (Inherits)"
read -p "Press any key to continue..."

sudo nvim /usr/share/icons/default/index.theme


sudo systemctl enable sddm


## Finishing
echo "After reboot and after setting qt5ct theme open lxappearance and select theme as dracula and cursor to bibata rainbow"
sleep 2
echo "Press any key to continue..."
echo "Rebooting..."
sleep 2
reboot
