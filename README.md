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
> Its important to run `echo 411e2a87a06fffb09385d77e561e8ee736b666b0b0259e7faf116764d2ec630b rice-setup.sh | sha256sum -c` to check the legitimacy of the script.
```sh
git clone https://github.com/BIGBEASTISHANK/dotfiles
cd dotfiles
echo 411e2a87a06fffb09385d77e561e8ee736b666b0b0259e7faf116764d2ec630b rice-setup.sh | sha256sum -c
chmod +x ./rice-setup.sh
./rice-setup.sh
```
