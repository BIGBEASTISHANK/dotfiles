#!/bin/bash

echo "---"
echo "Created by: BIGBEASTISHANK"
echo "Version 4.0.0"
echo "---"
sleep 5

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

echo "Updating the system..."
sleep 0.5
paru

install_blackarch_repo() {
    curl -O https://blackarch.org/strap.sh
    chmod +x strap.sh
    sudo ./strap.sh
    rm -f strap.sh
    paru
}
install_blackarch_repo

echo "---"
echo "Adding bin files..."
sleep 1
add_bin_files() {
    if [ -d "./bin" ]; then
        chmod +x ./bin/*
        sudo cp ./bin/* /usr/bin/
    else
        echo "Warning: ./bin directory not found"
    fi
}
add_bin_files

echo "---"
echo "Setting up configs..."
echo "---"
sleep 1.2

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
        echo ""
        echo "##$(printf '%*s' ${#dir} | tr ' ' '-')##"
        echo "## ${dir^} ##"
        echo "##$(printf '%*s' ${#dir} | tr ' ' '-')##"
        echo ""
        
        paru -S "$package"
        mkdir -p ~/.config/"$dir"/
        
        if [ -d "./config/$dir" ]; then
            if [[ "$dir" =~ ^(bspwm|dunst|polybar|sxhkd)$ ]]; then
                chmod +x ./config/"$dir"/*
            fi
            cp -r ./config/"$dir"/* ~/.config/"$dir"/
        fi
    done
    
    echo ""
    echo "##---------##"
    echo "## Vencord ##"
    echo "##---------##"
    echo ""
    mkdir -p ~/.config/Vencord/
    if [ -d "./config/Vencord" ]; then
        cp -r ./config/Vencord/* ~/.config/Vencord/
    fi
    echo "Vencord themes setup done..."
}
setup_configs

echo "---"
echo "Setting up wallpaper..."
echo "---"
mkdir -p ~/Pictures/
if [ -d "./Wallpaper" ]; then
    cp -r ./Wallpaper/ ~/Pictures/
fi

echo "Adding themes to respective places..."
echo "---"
sleep 0.5

setup_themes() {
    echo "Installing fonts..."
    paru -S ttf-font-awesome noto-fonts noto-fonts-emoji
    
    echo "---"
    echo "Copying Cursors..."
    if [ -d "./Themes/Cursor" ]; then
        sudo cp -r ./Themes/Cursor/* /usr/share/icons/
        mkdir -p ~/.config/gtk-3.0/
        echo "gtk-cursor-theme-name=Bibata-Rainbow-Modern" >> ~/.config/gtk-3.0/settings.ini
    fi
    sleep 0.3
    
    echo "Setting grub theme..."
    if [ -d "./Themes/Grub Theme/darkmatter" ]; then
        sudo mkdir -p /boot/grub/themes/ /usr/share/grub/themes/
        sudo cp -r "./Themes/Grub Theme/darkmatter/" /boot/grub/themes/
        sudo cp -r "./Themes/Grub Theme/darkmatter/" /usr/share/grub/themes/
    fi
    paru -S grub-customizer
    
    echo "---"
    echo "Copying Icons..."
    if [ -f "./Themes/Icons/candy-icons.tar" ]; then
        sudo tar xf ./Themes/Icons/candy-icons.tar -C /usr/share/icons/
    fi
    
    echo "Setting sddm themes"
    sleep 0.5
    paru -S sddm sddm-sugar-candy-git qt5-quickcontrols2
    if [ -d "./Themes/SDDM Theme/sugar-candy-custom" ]; then
        sudo cp -r "./Themes/SDDM Theme/sugar-candy-custom/" /usr/share/sddm/themes/
    fi
    if [ -f "./Themes/SDDM Theme/sddm.conf" ]; then
        sudo cp "./Themes/SDDM Theme/sddm.conf" /etc/
    fi
    sudo systemctl enable sddm
    
    echo "---"
    echo "Setting system themes"
    sleep 0.5
    
    paru -S kvantum kvantum-qt5 lxappearance qt5ct qt6ct dracula-gtk-theme kvantum-theme-dracula-git
    
    if [ -d "./Themes/System Theme/GTK" ]; then
        sudo cp -r "./Themes/System Theme/GTK"/* /usr/share/themes/
    fi
    
    mkdir -p ~/.config/Kvantum
    if [ -d "./Themes/System Theme/Kvantum" ]; then
        cp -r "./Themes/System Theme/Kvantum"/* ~/.config/Kvantum/
    fi
}
setup_themes

echo "---"
echo "Installing Important packages..."

install_important_packages() {
    local essential_packages=(
        "gvfs" "gvfs-mtp" "gvfs-smb" "less" "man" "base-devel" "htop"
        "alsa-utils" "pipewire" "pipewire-alsa" "pipewire-jack" "pipewire-pulse"
        "pcmanfm" "brave-bin" "gnome-calculator-gtk3" "nitrogen" "pavucontrol"
        "flameshot" "rofi-greenclip" "xorg-xsetroot" "network-manager-applet" "gpick"
        "xfce-polkit" "gnome-keyring" "selectdefaultapplication-git" "flatpak"
        "xorg-xinput" "xorg-xkill" "bat" "xclip" "rofi-emoji"
        "digimend-kernel-drivers-dkms-git" "xf86-input-wacom"
    )
    
    for package in "${essential_packages[@]}"; do
        paru -S "$package"
    done
}
install_important_packages

install_extra_packages() {
    local extra_packages=(
        "discord" "virtualbox" "virtualbox-host-modules-arch" "anytype-bin"
        "kdenlive" "audacity" "signal-desktop" "blender" "obs-studio"
        "simplescreenrecorder" "vlc" "stacer-bin" "gnome-text-editor"
        "hourglass" "eog" "proton-vpn-gtk-app" "file-roller" "vscodium-bin"
        "visual-studio-code-bin" "cava" "nvidia" "nvidia-settings" "nvidia-utils"
        "optimus-manager-qt-git" "gparted" "scrcpy" "veracrypt" "ventoy-bin"
        "onlyoffice-bin"
    )
    
    for package in "${extra_packages[@]}"; do
        paru -S "$package"
    done
    
    echo ""
    echo "Installing vencord, Please follow the instruction..."
    echo "---"
    sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
}

echo ""
echo "---"
read -p "Do you want to install the extra softwares? (yes/no): " answer
answer=${answer,,}

if [[ "$answer" == "yes" ]]; then
    install_extra_packages
else
    echo "---"
    echo "Skipping installation..."
fi

echo "---"
echo "Finishing..."
echo "---"
sleep 1

finishing_setup() {
    echo "Setting environment files..."
    if [ -f "./Themes/System Theme/enviroment" ]; then
        sudo sh -c 'cat "./Themes/System Theme/enviroment" >> /etc/environment'
    fi
    
    sleep 2
    
    echo ""
    echo "Setting up flathub..."
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    
    sleep 2
    
    echo ""
    echo "Setting ntp auto time"
    paru -S ntp
    sudo systemctl enable --now ntpd
    sudo timedatectl set-ntp true
    
    echo ""
    echo "Allowing user to change brightness with polybar"
    echo 'ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"' | sudo tee /etc/udev/rules.d/90-backlight.rules > /dev/null
    sudo usermod -aG video "$USER"
}
finishing_setup

display_notes() {
    clear
    echo "---"
    echo "Note:"
    echo "Themes: When you restart your system, run lxappearance, kvantum-manager and set theme to dracula, icons to candy-icons, cursor to bibata-rainbow-modern"
    echo ""
    echo "Grub: After setting themes, run grub-customizer and set theme to dark matter"
    echo ""
    echo "Reboot for changes to take place"
    echo "---"
}
display_notes
