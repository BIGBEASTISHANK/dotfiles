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
- **Version:** `3.1.3`
```sh
git clone https://github.com/BIGBEASTISHANK/dotfiles
cd dotfiles
echo a2a75d2e140b7497c18f681d7cfd3442b051e718ed05c18e3f8f009dd062ae1a syscopy.sh | sha256sum -c
chmod +x ./syscopy.sh
./syscopy.sh
```
