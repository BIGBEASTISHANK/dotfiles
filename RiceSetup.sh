#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
set -u  # Treat unset variables as an error when substituting

echo "Updating files..."
echo ""
sleep 2
git pull

## Making build directory
mkdir -p Build
cd ./Build

## Installing packages
# Paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..

rm -rf ./Build/

## Others
paru -S alacritty bspwm sddm dunst fish picom polybar rofi sxhkd p7zip --noconfirm
paru -S brave-bin network-manager-applet gpick flameshot pcmanfm discord --noconfirm
paru -S xorg-xsetroot xorg-xrandr xfce4-polkit neofetch nitrogen greenclip neovim --noconfirm
paru -S ttf-font-awesome noto-fonts noto-fonts-emoji --noconfirm
paru -S lxappearance qt5ct kvantum sddm-sugar-candy-git --noconfirm
paru -S nvidia nvidia-utils nvidia-settings optimus-manager optimus-manager-qt --noconfirm 

## Setting environment variable
echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee -a /etc/environment

## Setting Neovim for regular user
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

## Setting Neovim for root user
sudo git clone https://github.com/nvim-lua/kickstart.nvim.git "/root/.config/nvim"

## Moving config files
cd ../config/
# Giving right permission
chmod +x ./alacritty/* ./bspwm/* ./dunst/* ./fish/* ./picom/* ./polybar/* ./rofi/* ./sxhkd/*

# Moving configs
cp -r ./* $HOME/.config/
# Moving wallpaper
cd ../
cp -r ./Wallpaper/ $HOME/Pictures

## Moving Themes
cd ./Themes/
sudo cp -r ./Grub\ Theme/* /boot/grub/themes/

echo "#####"
echo "Opening grub config file to set theme. Please locate 'GRUB_THEME' and set its value to (GRUB_THEME='/boot/grub/themes/darkmatter/theme.txt')"
echo "#####"

sleep 2
read -n 1 -s -r -p "Press any key to continue..."

sudo nvim /etc/default/grub

# Making grub config again
sudo grub-mkconfig -o /boot/grub/grub.cfg

## SDDM theme
sudo cp -r ./SDDM\ Theme/sugar-candy-custom/ /usr/share/sddm/themes/
sudo cp ./SDDM\ Theme/sddm.conf /etc/

## System theme
# Icon themes
sudo 7z x ./Icons/candy-icons.tar -o/usr/share/icons/
sudo chown -R $(whoami):$(whoami) /usr/share/icons/candy-icons

# System theme (lxappearance)
# Cursor theme
sudo cp -r ./Cursor/* /usr/share/icons/
sudo chown -R $(whoami):$(whoami) /usr/share/icons/Bibata-Rainbow-Modern
sudo cp -r ./System\ Theme/Dracula /usr/share/themes/
sudo chown -R $(whoami):$(whoami) /usr/share/themes/Dracula

echo "#####"
echo "Opening a theme file please put (Bibata-Rainbow-Modern) value in (Inherits)"
echo "#####"
read -n 1 -s -r -p "Press any key to continue..."

sudo nvim /usr/share/icons/default/index.theme

sudo systemctl enable sddm

## Finishing
echo "#####"
echo "Important Note: After reboot, you will be greeted with the SDDM manager. For the first time, your system might not work properly, but don't worry."
echo "---"
echo "1. Click (Super + Return), then type (killall picom)"
echo "---"
echo "Note: If you can remember all this, just remember the first 1st and then type (cat path/to/RichSetup.sh) and read the steps."
echo "---"
echo "2. Now type (kvantummanager --set Dracula)"
echo "3. Type (qt5ct) and change the style to kvantum-dark"
echo "4. If your polybar doesn't show up, type (xrandr --listmonitors) and copy your monitor name"
echo "5. Run (nvim $HOME/.config/polybar/config.ini)"
echo "6. Scroll to (monitor) and change the name to your listed monitor"
echo "7. Type (optimus-manager --switch nvidia)"
echo "8. Log back in, and everything will work fine"
echo "#####"

sleep 2
read -n 1 -s -r -p "Press any key to continue..."
echo ""
echo "Rebooting..."
sleep 2
sudo reboot
