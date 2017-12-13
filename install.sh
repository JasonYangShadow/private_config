#!/bin/bash

INSTALLED_PACKAGE=~/installed_package
BASE=(arandr sysstat mesa lm_sensors acpi acpid git gdb update-grub base-devel neovim zsh tmux python2-pip pulseaudio pavucontrol alsa-utils networkmanager network-manager-applet dhclient terminator rofi feh ranger pcmanfm gparted htop gvfs exfat-utils xdotool xdgutils dmraid dmidecode dosfstools iptables linux-firmware aic94xx-firmware wd719-firmware nfs-3g nfs-utils gnome-keyring polkit-gnome tmux rfkill openssh python-virtualenv) 
BASE_ADD=(unclutter redshift vlc viewnior markdown mupdf zathura zathura-cb zathura-djvu zathura-ps zathura-pdf-mupdf fcitx fcitx-gtk3 fcitx-configtool fcitx-googlepinyin fcitx-kkc xfce4-power-manager isousb cronie shadowsocks proxychains-ng tor arm dnsutils xclip compton lua xscreensaver traceroute mtr)
SOFTWARES=(firefox thunderbird slack-desktop uget ctags telegram-desktop-bin latex-beamer nodejs npm electron nodejs-hexo-cli neofetch texlive-most docker qt4 simplescreenrecorder wqy-microhei lxappearance dropbox megasync downgrader variety feh lyx wps-office ttf-wps-fonts bleachbit go cmake visual-studio-code bashdb)

install(){
    paras=("$1")
    for item in $paras ; do
        COUNT=`grep -w $item $INSTALLED_PACKAGE |wc -l`
        if [ $COUNT -eq 0 ]; then
            if [ $2 = "pacman" ]; then
            echo "----------------------install $item--------------------------------"
               pacman -Su --noconfirm $item
            fi
            if [ $2 = "yaourt" ]; then
            echo "----------------------install $item--------------------------------"
               yaourt -S --noconfirm $item
            fi
        fi
    done
}

install_i3(){
    echo "----------------------install i3-gaps--------------------------------------"
    yaourt -S xorg-server i3-gaps i3-scrot i3blocks i3lock i3status powerline-fonts-git
}

install_spacevim(){
    echo "----------------------git clone spacevim--------------------------------------"
    curl -sLf https://spacevim.org/install.sh | bash
    cp ./init.vim.bak ~/.SpaceVim.d/init.vim
}

install_ohmyzsh(){
    echo "----------------------git clone oh my sh--------------------------------------"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

main(){
    touch ~/installed_package
    pacman -Qe|awk 'BEGIN{FS=" "};{print $1}' > $INSTALLED_PACKAGE 
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
            root=`echo $EUID`
            if [[ $root -ne 0 ]]; then
                echo "please execute this script using root"
                exit -1
            else
                echo "----------------------output yaourt address to pacman.conf--------------------------------------"
                echo "[archlinuxfr]" >> /etc/pacman.conf
                echo "SigLevel=Never" >> /etc/pacman.conf
                echo "Server=http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf
                echo "----------------------modify the mirrorlist--------------------------------------"
                cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
                cp ./mirrorlist.bak /etc/pacman.d/mirrorlist
                `pacman -Syu yaourt`
                install "${BASE[*]}" "pacman"
                echo "----------------------disable bluetooth--------------------------------------"
                `rfkill block bluetooth`
            fi
            ;;
        base_add )
            root=`echo $EUID`
            if [[ $root -ne 0 ]]; then
                echo "please execute this script using root"
                exit -1
            else
                install "${BASE_ADD[*]}" "pacman"
            fi
            echo "---------------------copy i3exit and blurlock to /usr/bin/ -------------------"
            cp ./i3exit /usr/bin/i3exit
            cp ./blurlock /usr/bin/blurlock
            ;;
        software )
            root=`echo $EUID`
            if [[ $root -eq 0 ]]; then
                echo "please execute this script using common user, not root"
                exit -1
            else
                install "${SOFTWARES[*]}" "yaourt"
            fi
            ;;
        i3 )
            root=`echo $EUID`
            if [[ $root -eq 0 ]]; then
                echo "please execute this script using common user, not root"
                exit -1
            else
                install_i3 
            fi
            ;;
        config )
            root=`echo $EUID`
            if [[ $root -eq 0 ]]; then
                echo "please execute this script using common user, not root"
                exit -1
            fi

            echo "--------------------copy configuraiton files---------------------------------"
            mkdir -p ~/.i3
            cp ./config.bak ~/.i3/config
            cp ./i3blocks.conf.bak ~/.i3/i3blocks.conf
            cp ./battery.py.bak ~/.i3/battery.py
            cp ./monitor.py.bak ~/.i3/monitor.py
            cp ./.xinitrc.bak ~/.xinitrc
            cp ./.autostart.sh.bak ~/.autostart.sh
            cp ./.cronjob.sh.bak ~/.cronjob.sh
            cp ./.tmux.conf.bak ~/.tmux.conf 
            cp ./.tmux.conf.local.bak ~/.tmux.conf.local 
            cp ./tor.py.bak ~/.i3/tor.py
            cp ./ss.py.bak ~/.i3/ss.py
            cp ./bandwidth.bak ~/.i3/bandwidth
            cp ./.zprofile.bak ~/.zprofile
            
            echo "---------------------copy customized fons--------------------------------------"
            mkdir -p ~/.local/share/fonts
            cp ./fonts/* ~/.local/share/fonts 
            fc-cache ~/.local/share/fonts
            echo "remember to copy torrc and create relative json file for ss"
            ;;
        spacevim )
            root=`echo $EUID`
            if [[ $root -eq 0 ]]; then
                echo "please execute this script using common user, not root"
                exit -1
            fi

            echo "--------------------install spacevim---------------------------------"
            install_spacevim
            ;;
        ohmyzsh )
            root=`echo $EUID`
            if [[ $root -eq 0 ]];then
                echo "please execute this script using common user, not root"
                exit -1
            fi
            echo "--------------------install ohmyzsh---------------------------------"
            install_ohmyzsh
            cp ./.zshrc.bak ~/.zshrc
            ;;
        * )
            echo "type is one of {base base_add software config spacevim ohmyzsh i3}"
            exit 0;
            ;;
    esac
}

main $@ | tee "~/installment.log" 
