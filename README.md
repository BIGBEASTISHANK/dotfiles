# DOTFILE

## Preview
![idle.png](/Preview/idle.png)
![working.png](/Preview/working.png)

## Install script
> [!Important]
> Run this script after installing OS. ONLY FOR `nvidia` and `linux` kernal. NO `linux-lts`.
- Version name convention: `[major].[minor].[patch]`

> [!Note]
> This is no more just a rice copy script. It has became a `nix.config` but for Arch user. You need to have a fresh Arch Install and then you can run `syscopy.sh` to get my entire range of software, tools & workflow enviorment. 

## Arch Linux
- **Version:** `3.3.6`
```sh
git clone https://github.com/BIGBEASTISHANK/dotfiles
cd dotfiles
echo a1fbc94b1a911b143c942eb98d47c0768b0ef94295592e2cc545eccfd9a8d529 syscopy.sh | sha256sum -c
chmod +x ./syscopy.sh
./syscopy.sh
```
