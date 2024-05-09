# DOTFILE

## Preview
![idle.png](/Preview/idle.png)
![working.png](/Preview/working.png)

## Install script
> [!Important]
> Run this script after installing OS. ONLY FOR `nvidia` and `linux` kernal. NO `linux-lts`.
- Version name convention: `[major].[structure].[bug].[package]` 

## Arch Linux
- **Version:** `1.2.6.7`
> [!Note]
> Its important to run `echo 0ddef850af16dc465b6743e139680fd1d9c1c89d0230ce0ce0a6847f57b27480 rice-setup.sh | sha256sum -c` to check the legitimacy of the script.

> [!Note]
> This script has been tested and confirmed that it works on.
> ```bash
>                   -`                     ishank@ArchBeast
>                  .o+`                    ----------------
>                 `ooo/                    OS: Arch Linux x86_64
>                `+oooo:                   Host: VivoBook 15_ASUS Laptop X507UF
>               `+oooooo:                  Kernel: 6.8.9-arch1-1
>               -+oooooo+:                 Uptime: 27 mins
>             `/:-:++oooo+:                Packages: 839 (pacman)
>            `/++++/+++++++:               Shell: fish 3.7.1
>           `/++++++++++++++:              Resolution: 1920x1080
>          `/+++ooooooooooooo/`            WM: bspwm (X11)
>         ./ooosssso++osssssso+`           Theme: Dracula [GTK2/3]
>        .oossssso-````/ossssss+`          Icons: candy-icons [GTK2/3]
>       -osssssso.      :ssssssso.         Terminal: alacritty
>      :osssssss/        osssso+++.        CPU: Intel(R) Core(TM) i5-8250U (8) @ 3.40 GHz
>     /ossssssss/        +ssssooo/-        GPU: Intel UHD Graphics 620
>   `/ossssso+/:-        -:/+osssso+-      GPU: NVIDIA GeForce MX130
>  `+sso+:-`                 `.-/+oso:     Memory: 2.50 GiB / 15.50 GiB
> `++:.                           `-/+/
> .`                                 `/
> ```

```sh
git clone https://github.com/BIGBEASTISHANK/dotfiles
cd dotfiles
echo 0ddef850af16dc465b6743e139680fd1d9c1c89d0230ce0ce0a6847f57b27480 rice-setup.sh | sha256sum -c
chmod +x ./rice-setup.sh
./rice-setup.sh
```
