# DOTFILE

## Preview
![idle.png](/Preview/idle.png)
![working.png](/Preview/working.png)

## Install script
> [!Important]
> Run this script after installing OS. ONLY FOR `nvidia` and `linux` kernal. NO `linux-lts`.
- Version name convention: `[major].[bug].[package]` 

## Arch Linux
- **Version:** `2.7.1`
```sh
git clone https://github.com/BIGBEASTISHANK/dotfiles
cd dotfiles
echo 71f5e1ef99392039379b24171f970f403f5aa361ac391a8a969c3e0c26db3080 rice-setup.sh | sha256sum -c
chmod +x ./rice-setup.sh
./rice-setup.sh
```
