#!/bin/bash

##---------##
## Credits ##
##---------##
echo "---"
echo "Created by: BIGBEASTISHANK"
echo "Version 1.2.6.9"
echo "---"
sleep 5

##-----------------##
## Installing paru ##
##-----------------##
if which paru >/dev/null 2>&1; then
    echo "Paru already installed, skipping installation."
    echo "---"
else
    echo "Installing paru..."
    echo "---"
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ../
    rm -rf paru
fi

##-----------------##
## Updating system ##
##-----------------##
echo "Updating the system..."
sleep 0.5
paru

##------------------##
## Adding bin files ##
##------------------##
echo "---"
echo "Adding bin files..."
sleep 1
function BinFiles() {
    chmod +x ./bin/*
    sudo cp ./bin/* /usr/bin/
}
BinFiles

##-------------------##
## Setting up config ##
##-------------------##
echo "---"
echo "Setting up configs..."
echo "---"
sleep 1.2

function SettingUpConfigs() {
    # Alacritty
    echo ""
    echo "##-----------##"
    echo "## Alacritty ##"
    echo "##-----------##"
    echo ""
    paru -S alacritty
    mkdir ~/.config/alacritty/
    cp ./config/alacritty/* ~/.config/alacritty/

    # Bspwm
    echo ""
    echo "##-------##"
    echo "## Bspwm ##"
    echo "##-------##"
    echo ""
    paru -S bspwm
    mkdir ~/.config/bspwm/
    chmod +x ./config/bspwm/*
    cp ./config/bspwm/* ~/.config/bspwm/

    # Dunst
    echo ""
    echo "##-------##"
    echo "## Dunst ##"
    echo "##-------##"
    echo ""
    paru -S dunst
    mkdir ~/.config/dunst/
    chmod +x ./config/dunst/*
    cp ./config/dunst/* ~/.config/dunst/

    # Fastfetch
    echo ""
    echo "##-----------##"
    echo "## Fastfetch ##"
    echo "##-----------##"
    echo ""
    paru -S fastfetch
    mkdir ~/.config/fastfetch/
    cp ./config/fastfetch/* ~/.config/fastfetch/

    # Fish
    echo ""
    echo "##------##"
    echo "## Fish ##"
    echo "##------##"
    echo ""
    paru -S fish
    mkdir ~/.config/fish/
    cp ./config/fish/* ~/.config/fish/

    # Nvim
    echo ""
    echo "##--------##"
    echo "## Neovim ##"
    echo "##--------##"
    echo ""
    paru -S neovim
    mkdir ~/.config/nvim/
    cp ./config/nvim/* ~/.config/nvim/

    # Picom
    echo ""
    echo "##-------##"
    echo "## Picom ##"
    echo "##-------##"
    echo ""
    paru -S picom
    mkdir ~/.config/picom/
    cp ./config/picom/* ~/.config/picom/

    # Polybar
    echo ""
    echo "##---------##"
    echo "## Polybar ##"
    echo "##---------##"
    echo ""
    paru -S polybar
    mkdir ~/.config/polybar/
    chmod +x ./config/polybar/*
    cp ./config/polybar/* ~/.config/polybar/

    # Rofi
    echo ""
    echo "##------##"
    echo "## Rofi ##"
    echo "##------##"
    echo ""
    paru -S rofi
    mkdir ~/.config/rofi/
    cp ./config/rofi/* ~/.config/rofi/

    # Sxhkd
    echo ""
    echo "##-------##"
    echo "## Sxhkd ##"
    echo "##-------##"
    echo ""
    paru -S sxhkd
    mkdir ~/.config/sxhkd/
    chmod +x ./config/sxhkd/*
    cp ./config/sxhkd/* ~/.config/sxhkd/

    # Vencord
    echo ""
    echo "##---------##"
    echo "## Vencord ##"
    echo "##---------##"
    echo ""
    mkdir ~/.config/Vencord/
    cp -r ./config/Vencord/* ~/.config/Vencord/
}
SettingUpConfigs

##-----------------------##
## Setting up wallpapers ##
##-----------------------##
echo "---"
echo "Setting up wallpaper..."
echo "---"

mkdir ~/Pictures/
cp -r ./Wallpaper/ ~/Pictures/

##--------##
## Themes ##
##--------##
echo "Adding themes to respective places..."
echo "---"
sleep 0.5

function SettingUpThemes() {
    # Fonts
    echo "Installing fonts..."
    paru -S ttf-font-awesome noto-fonts noto-fonts-emoji

    # Cursor
    echo "---"
    echo "Coping Cursors.."
    sudo cp -r ./Themes/Cursor/* /usr/share/icons/
    sleep 0.3

    # Grub thems
    echo "Setting grub theme.."
    sudo cp -r ./Themes/Grub\ Theme/darkmatter/ /boot/grub/themes/
    sudo cp -r ./Themes/Grub\ Theme/darkmatter/ /usr/share/grub/themes/
    paru -S grub-customizer

    # Icons
    echo "---"
    echo "Coping Icons.."
    sudo tar xvf ./Themes/Icons/candy-icons.tar -C /usr/share/icons/

    # SDDM Theme
    echo "Setting sddm themes"
    sleep 0.5
    paru -S sddm-sugar-candy-git
    sudo cp -r ./Themes/SDDM\ Theme/sugar-candy-custom/ /usr/share/sddm/themes/
    sudo cp ./Themes/SDDM\ Theme/sddm.conf /etc/
    sudo systemctl enable sddm

    # System Themes
    echo "---"
    echo "Setting system themes"
    sleep 0.5

    paru -S kvantum kvantum-qt5 lxappearance qt5ct qt6ct

    sudo cp -r ./Themes/System\ Theme/GTK/* /usr/share/themes/
    paru -S dracula-gtk-theme

    mkdir ~/.config/Kvantum
    cp -r ./Themes/System\ Theme/Kvantum/* ~/.config/Kvantum/
}
SettingUpThemes

##----------------------------------##
## Installing Important Application ##
##----------------------------------##
echo "---"
echo "Installing Important packages..."

InstallingImportantPackages() {
    paru -S pulseaudio alsa-utils pipewire-alsa
    paru -S pcmanfm gvfs brave-bin gnome-calculator-gtk3 nitrogen pavucontrol
    paru -S flameshot rofi-greenclip xorg-xsetroot network-manager-applet gpick
    paru -S xfce-polkit gnome-keyring selectdefaultapplication-git
    paru -S rofi-greenclip xorg-xinput xorg-xkill bat xclip rofi-emoji
}
InstallingImportantPackages

##------------------------------##
## Installing Extra Application ##
##------------------------------##
InstallingExtrasPackages() {
    paru -S discord

    echo ""
    echo "Installing vencord, Please follow the instruction.."
    echo "---"
    sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

    paru -S virtualbox virtualbox-host-modules-arch anytype-bin kdenlive audacity
    paru -S blender obs-studio prismlauncher-bin simplescreenrecorder vlc
    paru -S gnome-text-editor eog proton-vpn-gtk-app file-roller vscodium-bin
    paru -S visual-studio-code-bin cava nvidia nvidia-settings nvidia-utils
    paru -S optimus-manager-qt-git gparted scrcpy veracrypt
}

# Prompt the user for confirmation
echo ""
echo "---"
read -p "Do you want to install the extra softwares? (yes/no): " answer

# Convert the answer to lowercase for easier comparison
answer=${answer,,}

# Check if the user agrees (yes)
if [[ "$answer" == "yes" ]]; then
    InstallingExtrasPackages
else
    echo "---"
    echo "Skipping installation.."
fi

##-----------##
## Finishing ##
##-----------##
echo "---"
echo "Finishing........"
echo "---"
sleep 1

function Finishing() {
    # Setting enviorment files
    echo "Setting enviorment files.."
    sudo sh -c 'cat ./Themes/System\ Theme/enviroment >> /etc/environment'
}
Finishing

##------##
## Note ##
##------##
function Note(){
    echo ""
    echo ""
    echo "---"
    echo Note:
    echo "Themes: When you restart your system, run lxappearance, kvantum-manager and set theme to dracula, icons to candy-icons, cursor to bibata-rainbot-modern"
    echo ""
    echo "Grub: After setting themes, run grub-customizer and set theme to dark matter"
    echo ""
    echo "Reboot for changes to take place"
    echo "---"
}
Note
