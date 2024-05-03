# DOTFILE

## Preview
![idle.png](/Preview/idle.png)
![working.png](/Preview/working.png)

## Install script
> [!Important]
> This is fresh script and haven't tested yet. Please be carefull

> [!Important]
> Run this script after installing OS. ONLY FOR `nvidia` and `linux` kernal. NO `linux-lts`.

## Arch Linux
> [!Note]
> Its important to run `echo 6b0cbc37fcc8e2f4141c948602fd34891e1a2c8d rice-setup.sh | sha1sum -c` to check the legitimacy of the script.
```sh
git clone https://github.com/BIGBEASTISHANK/dotfiles
cd dotfiles
echo 6b0cbc37fcc8e2f4141c948602fd34891e1a2c8d rice-setup.sh | sha1sum -c
chmod +x ./rice-setup.sh
./rice-setup.sh
```
