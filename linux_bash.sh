#!/bin/bash

CURRENT=$(cd $(dirname $0);pwd)
cd
cd /tmp
git clone https://github.com/uav4geo/djiparsetxt.git
cd djiparsetxt
make
chmod 755 djiparsetxt

if [ ! -d /opt/djiparsetxt ]; then
    sudo mkdir /opt/djiparsetxt
    sudo cp /tmp/djiparsetxt/djiparsetxt /opt/djiparsetxt
    sudo cp $CURRENT/wrapper.sh /opt/djiparsetxt
elif [ ! -f /opt/djiparsetxt/djiparsetxt ]; then
    sudo cp /tmp/djiparsetxt/djiparsetxt /opt/djiparsetxt
fi 

if [ ! -f /opt/djiparsetxt/wrapper.sh ]; then
        sudo cp $CURRENT/wrapper.sh /opt/djiparsetxt
fi


# PATHの確認
if [ -f ~./bashrc ]; then #.bashrcがあったら
    grep 'export PATH=$PATH:/opt/djiparsetxt' ~/.bashrc >> /dev/null
    if [ ! $? -eq 0 ];then
        if [ -f ~./bashrc ]; then
            grep 'export PATH=$PATH:/opt/djiparsetxt' ~/.bashrc >> /dev/null
            if [ ! $? -eq 0 ];then
                echo "export PATH=$PATH:/opt/djiparsetxt" >> ~/.bashrc
            fi
        else
            echo "export PATH=$PATH:/opt/djiparsetxt" >> ~/.bashrc
        fi
    fi
elif [ ! -f ~./bashrc ]; then #.bashrcがなかったら
    if [ -f ~./bashrc ]; then #.bashrcがあるか確認する
        grep 'export PATH=$PATH:/opt/djiparsetxt' ~/.bashrc >> /dev/null
        if [ ! $? -eq 0 ];then #.bashrcにパスがなかったら
            echo "export PATH=$PATH:/opt/djiparsetxt" >> ~/.bashrc
        fi
    else
        echo "export PATH=$PATH:/opt/djiparsetxt" > ~/.bashrc
    fi
fi

#エイリアスの確認
if [ -f ~./bashrc ]; then #.bashrcがあったら
    grep 'alias log2csv='wrapper.sh $PWD'' ~/.bashrc >> /dev/null
    if [ ! $? -eq 0 ];then
        if [ -f ~./bashrc ]; then
            grep 'alias log2csv='wrapper.sh $PWD'' ~/.bashrc >> /dev/null
            if [ ! $? -eq 0 ];then
                echo "alias log2csv='wrapper.sh $PWD'" >> ~/.bashrc
            fi
        else
            echo "alias log2csv='wrapper.sh $PWD'" >> ~/.bashrc
        fi
    fi
elif [ ! -f ~./bashrc ]; then #.bashrcがなかったら
    if [ -f ~./bashrc ]; then #.bashrcがあるか確認する
        grep 'alias log2csv='wrapper.sh $PWD'' ~/.bashrc >> /dev/null
        if [ ! $? -eq 0 ];then #.bashrcにパスがなかったら
            echo "alias log2csv='wrapper.sh $PWD'" >> ~/.bashrc
        fi
    else
        echo "alias log2csv='wrapper.sh $PWD'" > ~/.bashrc
    fi
fi

source ~/.bashrc
