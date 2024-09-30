# DOTFILE

## Preview
![idle.png](/Preview/idle.png)
![working.png](/Preview/working.png)

## Install script
> [!Important]
> Run this script after installing OS. ONLY FOR `nvidia` and `linux` kernal. NO `linux-lts`.
- Version name convention: `[major].[bug].[package]` 

## Arch Linux
- **Version:** `2.8.5`
```sh
git clone https://github.com/BIGBEASTISHANK/dotfiles
cd dotfiles
echo 19df0aebf689080180e0c99c523bab014805c79205a54d8dfb437b0284d81aca rice-setup.sh | sha256sum -c
chmod +x ./rice-setup.sh
./rice-setup.sh
```
