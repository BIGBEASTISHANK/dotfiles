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
- **Version:** `3.0.1`
```sh
git clone https://github.com/BIGBEASTISHANK/dotfiles
cd dotfiles
echo 91d885529adafca36ed905e5f05f68b236f2d626efea048b80f6099948e8ddbb syscopy.sh | sha256sum -c
chmod +x ./syscopy.sh
./syscopy.sh
```
