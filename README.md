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
- **Version:** `3.1.5`
```sh
git clone https://github.com/BIGBEASTISHANK/dotfiles
cd dotfiles
echo 8a0326ec054fccf81b77add9c12df4a593e7c89db5a9c12f81dd07938b9cdbaf syscopy.sh | sha256sum -c
chmod +x ./syscopy.sh
./syscopy.sh
```
