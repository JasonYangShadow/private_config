#!/bin/bash

INSTALLED_PACKAGE=/tmp/installed_package
BASE=(yaourt xorg xorg-xinit arandr sysstat git gcc gdb neovim zsh tmux python3 python-pip i3-gaps i3exit lightdm pulseaudio networkmanager network-manager-applet bluez blueman xfce4-terminal rofi xarchiver unrar lxappearance nitrogen ranger pcmanfm gparted htop unclutter redshift vlc-nightly cmake viewnior mupdf markdown zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps ibus ibus-kkc ibus-pinyin xfce4-power-manager texlive-most inkscape) 
SOFTWARES=(powerline-fonts-git oh-my-zsh-git google-chrome-stable thunderbird slack-desktop xfce4-terminal-base16-colors-git uget tor-browser filezilla xmind visual-paradigm-community wps-office ttf-wps-fonts ttf-ms-fonts)
pacman -Qe > $INSTALLED_PACKAGE 

install(){
    paras=("$1")
    for item in $paras ; do
        COUNT=`grep $item $INSTALLED_PACKAGE |wc -l`
        if [ $COUNT -eq 0 ]; then
            if [ $2 = "pacman" ]; then
            echo "----------------------install $item--------------------------------"
               pacman -S --noconfirm $item
            fi
            if [ $2 = "yaourt" ]; then
            echo "----------------------install $item--------------------------------"
               yaourt -S --noconfirm $item
            fi
        fi
    done
    }

install "${BASE[*]}" "pacman"

echo "----------------------copy configuraiton files--------------------------------------"
mkdir -p ~/.i3
cp ./config.bak ~/.i3/config
cp ./i3blocks.conf.bak ~/.i3/i3blocks.conf
cp ./battery.py.bak ~/.i3/battery.py
cp ./monitor.sh.bak ~/.i3/monitor.sh
cp ./.xinitrc.bak ~/.xinitrc
cp ./.extend.xinitrc.bak ~/.extend.xinitrc
cp ./.autostart.sh.bak ~/.autostart.sh
cp ./.blur_lock.sh.bak ~/.blur_lock.sh
cp ./.cronjob.sh.bak ~/.cronjob.sh
cp ./.tmux.conf.bak ~/.tmux.conf
cp ./.Xresources.bak ~/.Xresources

install "${SOFTWARES[*]}" "yaourt"

echo "----------------------git clone spacevim--------------------------------------"
curl -sLf https://spacevim.org/install.sh | bash

cp ./init.vim.bak ~/.SpaceVim.d/init.vim


