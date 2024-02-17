#!/bin/sh

## Making build directory
mkdir Build ; cd ./Build

## Installing packages
# Paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ../

## Others
paru -S alacritty bspwm sddm dunst fish picom polybar rofi sxhkd --noconfirm
paru -S brave-bin gpick flameshot pcmanfm discord --noconfirm
paru -S xorg-xsetroot xfce4-polkit neofetch nitrogen greenclip neovim --noconfirm
paru -S ttf-font-awesome noto-fonts noto-fonts-emoji --noconfirm
paru -S lxappearance qt5ct kvantum sddm-sugar-candy-git --noconfirm
paru -S nvidia nvidia-utils nvidia-settings optimus-manager optimus-manager-qt --noconfirm 

## Setting default gpu
echo "#####"
echo "#####"
echo "Opening optimus-manager.conf, find (startup_mode) and set it's value to (nvidia)"
echo "#####"
echo "#####"
sleep 2
read -p "Press any key to continue..."

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

echo "#####"
echo "#####"
echo "Opening grub config file to set theme. Please locate 'GRUB_THEME' and set it's value to (GRUB_THEME='/boot/grub/themes/darkmatter/theme.txt')"
echo "#####"
echo "#####"

sleep 2
read -p "Press any key to continue..."

sudo nvim /etc/default/grub

# Making grub config again
sudo grub-mkconfig -o /boot/grub/grub.cfg


## SDDM theme
sudo cp -r ./SDDM\ Theme/sugar-candy-custom/ /usr/share/sddm/themes/
sudo cp ./SDDM\ Theme/sddm.conf /etc/

## System theme
# Icon themes
sudo ark -b ./Icons/candy-icons.tar.xz -o /usr/share/icons/

# Kvantum
mkdir $HOME/.config/Kvantum/
cp -r ./System\ Theme/Dracula\ Kvantum/ $HOME/.config/Kvantum/Dracula/
kvantummanager --set Dracula

# Qt5ct
echo "#####"
echo "#####"
echo "After reboot and login to you bspwm enviorment press (Super + Shift + Return) then type qt5ct and press enter. A application will open and then click on style and change it to kvantum-dark"
echo "#####"
echo "#####"

read -p "Press any key to continue..."

# System theme (lxappearance)
# Cursor theme
sudo cp -r ./Cursor/* /usr/share/icons/
sudo cp -r ./System\ Theme/Dracula /usr/share/themes/

echo "#####"
echo "#####"
echo "Opening a theme file please put (Bibata-Rainbow-Modern) value in (Inherits)"
echo "#####"
echo "#####"
read -p "Press any key to continue..."

sudo nvim /usr/share/icons/default/index.theme


sudo systemctl enable sddm


## Finishing
echo "#####"
echo "#####"
echo "After reboot and after setting qt5ct theme open lxappearance and select theme as dracula, cursor to bibata rainbow, icon themes to candy icon."
echo "#####"
echo "#####"
sleep 2
read -p "Press any key to continue..."
echo "#####"
echo "#####"
echo "Rebooting..."
echo "#####"
echo "#####"
sleep 2
reboot
