# DOTFILE

## Preview
![idle.png](/Preview/idle.png)
![working.png](/Preview/working.png)

## Install script
> [!Important]
> Run this script after installing OS. ONLY FOR `nvidia` and `linux` kernal. NO `linux-lts`.
- Version name convention: `[major].[bug].[package]` 

## Arch Linux
- **Version:** `2.7.0`
```sh
git clone https://github.com/BIGBEASTISHANK/dotfiles
cd dotfiles
echo 461fc11a534f22df3eac231081bf908ba89c6b4f380cd8f07caf8cf90dee7000 rice-setup.sh | sha256sum -c
chmod +x ./rice-setup.sh
./rice-setup.sh
```
