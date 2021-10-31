#!/bin/sh
os=`uname`

if [ $os = "Linux" ]; then
    chmod 755 linux_install.sh
    ./linux_install.sh
else
    chmod 755 mac_install.sh
    ./mac_install.sh
fi



