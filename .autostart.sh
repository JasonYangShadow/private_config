/bin/sh

InstCheck(){
 inst=`ps -ef|grep -v grep|grep $1|wc -l`
 if [ $inst -ge 1 ];then
     return 0 
 else
     return 1 
 fi
}

InstCheck ibus 
if [ $? -ne 0 ];then
    ibus-daemon -drx & 
fi

InstCheck nm-applet 
if [ $? -ne 0 ];then
    nm-applet & 
fi

InstCheck slack 
if [ $? -ne 0 ];then
    slack & 
fi

InstCheck thunderbird 
if [ $? -ne 0 ];then
    thunderbird & 
fi

InstCheck xfce4-power-manager 
if [ $? -ne 0 ];then
    xfce4-power-manager & 
fi

InstCheck unclutter
if [ $? -ne 0 ];then
    unclutter -idle 2 &
fi

InstCheck redshift
if [ $? -ne 0 ];then
    redshift -t 6500:4500 -l 35.4:139.4 &
fi

InstCheck dropbox 
if [ $? -ne 0 ];then
    dropbox &
fi

InstCheck megasync
if [ $? -ne 0 ];then
    megasync &
fi

InstCheck overgrive 
if [ $? -ne 0 ];then
    python2 /opt/thefanclub/overgrive/overgrive &
fi

InstCheck chrome 
if [ $? -ne 0 ];then
    google-chrome-stable &
fi

InstCheck zoom 
if [ $? -ne 0 ];then
    zoom &
fi
