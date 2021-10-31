#!/bin/sh

#This script is intended to be run on a mac
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install git
CURRENT=$(cd $(dirname $0);pwd)
cd
cd /tmp
git clone https://github.com/uav4geo/djiparsetxt.git
cd djiparsetxt
make
chmod 755 djiparsetxt

if [ ! -d /usr/local/opt/djiparsetxt ]; then
    mkdir /usr/local/opt/djiparsetxt
    cp /tmp/djiparsetxt/djiparsetxt /usr/local/opt/djiparsetxt
    cp $CURRENT/wrapper.sh /usr/local/opt/djiparsetxt
elif [ ! -f /usr/local/opt/djiparsetxt/djiparsetxt ]; then
    cp /tmp/djiparsetxt/djiparsetxt /usr/local/opt/djiparsetxt
fi 

if [ ! -f /usr/local/opt/djiparsetxt/wrapper.sh ]; then
        cp $CURRENT/wrapper.sh /usr/local/opt/djiparsetxt
fi


# PATHの確認
if [ -f ~./bash_profile ]; then #.bash_profileがあったら
    grep 'export PATH=$PATH:/usr/local/opt/djiparsetxt' ~/.bash_profile >> /dev/null
    if [ ! $? -eq 0 ];then
        if [ -f ~./bashrc ]; then
            grep 'export PATH=$PATH:/usr/local/opt/djiparsetxt' ~/.bashrc >> /dev/null
            if [ ! $? -eq 0 ];then
                echo "export PATH=$PATH:/usr/local/opt/djiparsetxt" >> ~/.bash_profile
            fi
        else
            echo "export PATH=$PATH:/usr/local/opt/djiparsetxt" >> ~/.bash_profile
        fi
    fi
elif [ ! -f ~./bash_profile ]; then #.bash_profileがなかったら
    if [ -f ~./bashrc ]; then #.bashrcがあるか確認する
        grep 'export PATH=$PATH:/usr/local/opt/djiparsetxt' ~/.bashrc >> /dev/null
        if [ ! $? -eq 0 ];then #.bashrcにパスがなかったら
            echo "export PATH=$PATH:/usr/local/opt/djiparsetxt" >> ~/.bash_profile
        fi
    else
        echo "export PATH=$PATH:/usr/local/opt/djiparsetxt" > ~/.bash_profile
    fi
fi

#エイリアスの確認
if [ -f ~./bash_profile ]; then #.bash_profileがあったら
    grep 'alias log2csv='wrapper.sh $PWD'' ~/.bash_profile >> /dev/null
    if [ ! $? -eq 0 ];then
        if [ -f ~./bashrc ]; then
            grep 'alias log2csv='wrapper.sh $PWD'' ~/.bashrc >> /dev/null
            if [ ! $? -eq 0 ];then
                echo "alias log2csv='wrapper.sh $PWD'" >> ~/.bash_profile
            fi
        else
            echo "alias log2csv='wrapper.sh $PWD'" >> ~/.bash_profile
        fi
    fi
elif [ ! -f ~./bash_profile ]; then #.bash_profileがなかったら
    if [ -f ~./bashrc ]; then #.bashrcがあるか確認する
        grep 'alias log2csv='wrapper.sh $PWD'' ~/.bashrc >> /dev/null
        if [ ! $? -eq 0 ];then #.bashrcにパスがなかったら
            echo "alias log2csv='wrapper.sh $PWD'" >> ~/.bash_profile
        fi
    else
        echo "alias log2csv='wrapper.sh $PWD'" > ~/.bash_profile
    fi
fi
