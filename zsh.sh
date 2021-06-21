#!/bin/zsh

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
cd `dirname $0` #このスクリプトが置かれているパスまで戻ってくる
if [[ ! -d /usr/local/opt/djiparsetxt ]]; then #ディレクトリの確認
    mkdir /usr/local/opt/djiparsetxt
    cp /tmp/djiparsetxt/djiparsetxt /usr/local/opt/djiparsetxt
    cp $CURRENT/wrapper.sh /usr/local/opt/djiparsetxt
elif [[ ! -f /usr/local/opt/djiparsetxt/djiparsetxt ]]; then
    cp /tmp/djiparsetxt/djiparsetxt /usr/local/opt/djiparsetxt
fi

if [[ ! -f /usr/local/opt/djiparsetxt/wrapper.sh ]]; then
        cp $CURRENT/wrapper.sh /usr/local/opt/djiparsetxt
fi

if [[ ! -f ~/.zshrc ]]; then
    echo "export PATH=$PATH:/usr/local/opt/djiparsetxt" >> ~/.zshrc
    echo "alias log2csv='wrapper.sh'" >> ~/.zshrc
else
    grep 'export PATH=$PATH:/usr/local/opt/djiparsetxt' ~/.zshrc >> /dev/null
    if [ ! $? -eq 0 ];then
        echo "export PATH=$PATH:/usr/local/opt/djiparsetxt" >> ~/.zshrc
    fi
    grep 'alias log2csv='wrapper.sh'' >> /dev/null
    if [ ! $? -eq 0 ];then
        echo "alias log2csv='wrapper.sh'" >> ~/.zshrc
    fi
fi