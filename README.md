# DOTFILE

## Preview
![idle.png](/Preview/idle.png)
![working.png](/Preview/working.png)

## Install script
> [!Important]
> Run this script after installing OS. ONLY FOR `nvidia` and `linux` kernal. NO `linux-lts`.
- Version name convention: `[major].[bug].[package]` 

> [!Note]
> This is no more just a rice copy script. It has became a `nix.config` but for Arch user. You need to have a fresh Arch Install and then you can run `syscopy.sh` to get my entire range of software, tools & workflow enviorment. 

## Arch Linux
- **Version:** `3.2.1`
```sh
git clone https://github.com/BIGBEASTISHANK/dotfiles
cd dotfiles
echo d9f0b1ba1244ea1047d8263c964fc7d8e022e5b7983e1ad7286bf96487fa7317 syscopy.sh | sha256sum -c
chmod +x ./syscopy.sh
./syscopy.sh
```
