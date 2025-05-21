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
- **Version:** `3.2.2`
```sh
git clone https://github.com/BIGBEASTISHANK/dotfiles
cd dotfiles
echo 4e252a5f38bbff363ffb4ffb5607d478709a8f8726999f7103113c7594eea0de syscopy.sh | sha256sum -c
chmod +x ./syscopy.sh
./syscopy.sh
```
