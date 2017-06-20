#!/bin/bash

INSTALLED_PACKAGE=/tmp/installed_package
BASE=(yaourt xorg xorg-xinit arandr sysstat lm_sensors acpi acpid pamac git gcc automake make autoconf gdb fakeroot neovim zsh tmux python3 python-pip lightdm pulseaudio networkmanager network-manager-applet bluez blueman xfce4-terminal rofi xarchiver unrar lxappearance nitrogen ranger pcmanfm gparted htop) 
BASE_ADD=(unclutter redshift vlc-nightly cmake viewnior mupdf markdown zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps ibus ibus-kkc ibus-pinyin xfce4-power-manager texlive-most inkscape isousb hexchat)
SOFTWARES=(i3-gaps powerline-fonts-git oh-my-zsh-git google-chrome-stable thunderbird slack-desktop xfce4-terminal-base16-colors-git uget tor-browser filezilla xmind visual-paradigm-community wps-office ttf-wps-fonts ttf-ms-fonts paper-icon-theme)
pacman -Qe > $INSTALLED_PACKAGE 

install(){
    paras=("$1")
    for item in $paras ; do
        COUNT=`grep -o $item $INSTALLED_PACKAGE |wc -l`
        if [ $COUNT -eq 0 ]; then
            if [ $2 = "pacman" ]; then
            echo "----------------------install $item--------------------------------"
               pacman -Syu --noconfirm $item
            fi
            if [ $2 = "yaourt" ]; then
            echo "----------------------install $item--------------------------------"
               yaourt -Syu --noconfirm $item
            fi
        fi
    done
    }

install_spacevim(){
    echo "----------------------git clone spacevim--------------------------------------"
    curl -sLf https://spacevim.org/install.sh | bash
    cp ./init.vim.bak ~/.SpaceVim.d/init.vim
}

check_root(){
    if [ "$EUID" -ne 0 ]; then
        echo "please run as root"
        exit 0
    fi
}

main(){
    while [ "$1" != "" ]; do
        case $1 in 
            -t | --type )
                shift
                type=$1
                ;;
            *)
            echo "wrong input, please use -t"
            exit 0 
            ;;
        esac
        shift
    done
    
    case "$type" in
        base )
            check_root    
            install "${BASE[*]}" "pacman"
            ;;
        base_add )
            check_root    
            install "${BASE_ADD[*]}" "pacman"
            echo "---------------------copy i3exit and blurlock to /usr/bin/ -------------------"
            cp ./i3exit /usr/bin/i3exit
            cp ./.blur_lock.sh.bak /usr/bin/blurlock
            ;;
        software )
            install "${SOFTWARES[*]}" "yaourt"
            ;;
        config )
            echo "--------------------copy configuraiton files---------------------------------"
            mkdir -p ~/.i3
            cp ./config.bak ~/.i3/config
            cp ./i3blocks.conf.bak ~/.i3/i3blocks.conf
            cp ./battery.py.bak ~/.i3/battery.py
            cp ./monitor.sh.bak ~/.i3/monitor.sh
            cp ./.xinitrc.bak ~/.xinitrc
            cp ./.extend.xinitrc.bak ~/.extend.xinitrc
            cp ./.autostart.sh.bak ~/.autostart.sh
            cp ./.cronjob.sh.bak ~/.cronjob.sh
            cp ./.tmux.conf.bak ~/.tmux.conf
            cp ./.Xresources.bak ~/.Xresources
            
            echo "---------------------copy customized fons--------------------------------------"
            mkdir -p ~/.local/share/fonts
            cp ./fonts/* ~/.local/share/fonts 
            fc-cache ~/.local/share/fonts

            ;;
        spacevim )
            echo "--------------------install spacevim---------------------------------"
            install_spacevim
            ;;
        * )
            echo "type is one of {base base_add software config spacevim}"
            exit 0;
            ;;
    esac
}

main $@
