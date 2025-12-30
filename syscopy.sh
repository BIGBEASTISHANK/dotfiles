#!/bin/bash

# Metadata
echo "---"
echo "Created by: BIGBEASTISHANK"
echo "Version 5.3.3 - Auto Installer"
echo "---"
sleep 2

# Configuration Flags
INSTALL_EXTRA_SOFTWARE=""

usage() {
    echo "Usage: $0 --install-extras=true|false"
    exit 1
}

if [ $# -eq 0 ]; then
    echo "Error: Missing required argument."
    usage
fi

for arg in "$@"; do
    case $arg in
        --install-extras=true)
            INSTALL_EXTRA_SOFTWARE=true
            ;;
        --install-extras=false)
            INSTALL_EXTRA_SOFTWARE=false
	    ;;
        *)
            echo "Error: Invalid argument: $arg"
            usage
            ;;
    esac
done

# Installing very important base-devel
sudo pacman -Syu --noconfirm base-devel

# Check paru
if which paru >/dev/null 2>&1; then
    echo "Paru already installed, skipping installation."
else
    echo "Installing paru..."
    git clone https://aur.archlinux.org/paru.git
    cd paru || exit 1
    makepkg -si --noconfirm
    cd ..
    rm -rf paru
fi

echo "Updating the system..."
paru -Syu --noconfirm

# Install BlackArch repo
install_blackarch_repo() {
    curl -O https://blackarch.org/strap.sh
    chmod +x strap.sh
    sudo ./strap.sh
    rm -f strap.sh
    paru -Syu --noconfirm
}
install_blackarch_repo

# Add bin files
echo "Adding bin files..."
if [ -d "./bin" ]; then
    chmod +x ./bin/*
    sudo cp ./bin/* /usr/bin/
else
    echo "Warning: ./bin directory not found"
fi

# Setup configs
echo "Setting up configs..."
sleep 1
setup_configs() {
    local configs=(
        "alacritty:alacritty"
        "bspwm:bspwm"
        "dunst:dunst"
        "fastfetch:fastfetch"
        "fish:fish"
        "nvim:neovim"
        "picom:picom"
        "polybar:polybar"
        "rofi:rofi"
        "sxhkd:sxhkd"
    )

    for config in "${configs[@]}"; do
        IFS=':' read -r dir package <<< "$config"
        echo "## Setting up $dir ##"
        paru -S --noconfirm "$package"
        mkdir -p $HOME/.config/"$dir"
        if [ -d "./config/$dir" ]; then
            [[ "$dir" =~ ^(bspwm|dunst|polybar|sxhkd)$ ]] && chmod +x ./config/"$dir"/*
            cp -r ./config/"$dir"/* $HOME/.config/"$dir"/
        fi
    done

    # Vencord
    echo "## Setting up Vencord ##"
    mkdir -p $HOME/.config/Vencord
    if [ -d "./config/Vencord" ]; then
        cp -r ./config/Vencord/* $HOME/.config/Vencord/
    fi
}
setup_configs

# Wallpaper
echo "Setting up wallpaper..."
mkdir -p $HOME/Pictures/Wallpapers
[ -d "./Wallpaper" ] && cp -rn ./Wallpaper/* $HOME/Pictures/Wallpapers/

# Themes
echo "Setting up themes..."
setup_themes() {
    paru -S --noconfirm ttf-font-awesome-5 noto-fonts noto-fonts-emoji

    # Cursor
    if [ -d "./Themes/Cursor" ]; then
        sudo cp -r ./Themes/Cursor/* /usr/share/icons/
        mkdir -p $HOME/.config/gtk-3.0/
        touch $HOME/.config/gtk-3.0/settings.ini
        cat > $HOME/.config/gtk-3.0/settings.ini <<EOF
[Settings]
gtk-theme-name=Dracula
gtk-icon-theme-name=candy-icons
gtk-cursor-theme-name=Bibata-Rainbow-Modern
EOF
	sudo cp $HOME/.config/gtk-3.0/settings.ini /usr/share/gtk-3.0/settings.ini
    fi

    # Grub Theme
    if [ -d "./Themes/Grub Theme/darkmatter" ]; then
        sudo mkdir -p /boot/grub/themes /usr/share/grub/themes
        sudo cp -r "./Themes/Grub Theme/darkmatter/" /boot/grub/themes/
        sudo cp -r "./Themes/Grub Theme/darkmatter/" /usr/share/grub/themes/
    fi
    paru -S --noconfirm grub-customizer

    # Icons
    if [ -f "./Themes/Icons/candy-icons.tar" ]; then
    	mkdir $HOME/.icons
        sudo tar xf ./Themes/Icons/candy-icons.tar -C /usr/share/icons/
        tar xf ./Themes/Icons/candy-icons.tar -C $HOME/.icons/
        mkdir $HOME/.icons/default
        touch $HOME/.icons/default/index.theme
        cat > $HOME/.icons/default/index.theme <<EOF
[Icon Theme]
Name=Default
Inherits=Bibata-Rainbow-Modern
EOF
	sudo rm /usr/share/icons/default/index.theme
	sudo tee /usr/share/icons/default/index.theme > /dev/null <<EOF
[Icon Theme]
Inherits=bibata-rainbow-modern
EOF

    fi

    # SDDM Theme
    paru -S --noconfirm sddm sddm-sugar-candy-git qt5-quickcontrols2
    if [ -d "./Themes/SDDM Theme/sugar-candy-custom" ]; then
        sudo cp -r "./Themes/SDDM Theme/sugar-candy-custom/" /usr/share/sddm/themes/
    fi
    if [ -f "./Themes/SDDM Theme/sddm.conf" ]; then
        sudo cp "./Themes/SDDM Theme/sddm.conf" /etc/
    fi
    sudo systemctl enable sddm

    # System Themes
    paru -S --noconfirm kvantum kvantum-qt5 lxappearance qt5ct qt6ct dracula-gtk-theme kvantum-theme-dracula-git
    [ -d "./Themes/System Theme/GTK" ] && sudo cp -r ./Themes/System\ Theme/GTK/* /usr/share/themes/ && mkdir $HOME/.themes && cp -r ./Themes/System\ Theme/GTK/* $HOME/.themes/
    mkdir -p $HOME/.config/Kvantum
    [ -d "./Themes/System Theme/Kvantum" ] && cp -r ./Themes/System\ Theme/Kvantum/* $HOME/.config/Kvantum/
}
setup_themes

# Install essential packages
echo "Installing important packages..."
install_important_packages() {
    local packages=(
        "gvfs" "gvfs-mtp" "gvfs-smb" "less" "man" "htop" "lsd"
        "alsa-utils" "pipewire" "pipewire-alsa" "pipewire-jack" "pipewire-pulse"
        "pcmanfm" "brave-bin" "librewolf-bin" "gnome-calculator-gtk3" "nitrogen" "pavucontrol"
        "flameshot" "rofi-greenclip" "xorg-xsetroot" "network-manager-applet"
        "gpick" "xfce-polkit" "gnome-keyring" "kwallet-pam" "selectdefaultapplication-git"
        "flatpak" "xorg-xinput" "xorg-xkill" "bat" "xclip" "rofi-emoji"
        "digimend-kernel-drivers-dkms-git" "xf86-input-wacom"
    )

    for pkg in "${packages[@]}"; do
        paru -S --noconfirm "$pkg"
    done
}
install_important_packages

# Extra software installation
install_extra_packages() {
    local extras=(
        "discord" "virtualbox" "virtualbox-host-modules-arch" "anytype-bin"
        "kdenlive" "audacity" "signal-desktop" "blender" "obs-studio"
        "simplescreenrecorder" "vlc" "stacer-bin" "gnome-text-editor"
        "hourglass" "eog" "proton-vpn-gtk-app" "file-roller" "vscodium-bin"
        "visual-studio-code-bin" "cava" "nvidia" "nvidia-settings" "nvidia-utils"
        "optimus-manager-qt-git" "gparted" "scrcpy" "veracrypt" "ventoy-bin"
        "onlyoffice-bin"
    )

    for pkg in "${extras[@]}"; do
        paru -S --noconfirm "$pkg"
    done

    echo "Installing Vencord..."
    sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)" <<< "1"
}

if [ "$INSTALL_EXTRA_SOFTWARE" = "true" ]; then
    install_extra_packages
fi

# Finishing setup
echo "Finalizing setup..."
finishing_setup() {
    if [ -f "./Themes/System Theme/enviroment" ]; then
        while read -r line; do
            grep -qxF "$line" /etc/environment || echo "$line" | sudo tee -a /etc/environment > /dev/null
        done < "./Themes/System Theme/enviroment"
    fi

    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    paru -S --noconfirm ntp
    sudo systemctl enable --now ntpd
    sudo timedatectl set-ntp true

    echo 'ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"' | \
        sudo tee /etc/udev/rules.d/90-backlight.rules > /dev/null
    sudo usermod -aG video "$USER"
}
finishing_setup

# Final notes
clear
echo "---"
echo "INSTALLATION COMPLETE"
echo "---"
echo "Note:"
echo "- Use lxappearance, kvantum-manager, qt5ct & qt6ct to set GTK and Kvantum themes."
echo "- Use grub-customizer to set grub theme to dark matter."
echo "- Reboot your system for all changes to take effect."
echo "---"

