#!/bin/zsh

CURRENT=$(cd $(dirname $0);pwd)
cd
cd /tmp
git clone https://github.com/uav4geo/djiparsetxt.git
cd djiparsetxt
make
chmod 755 djiparsetxt
cd `dirname $0` #このスクリプトが置かれているパスまで戻ってくる
if [[ ! -d /opt/djiparsetxt ]]; then #ディレクトリの確認
    mkdir /opt/djiparsetxt
    cp /tmp/djiparsetxt/djiparsetxt /opt/djiparsetxt
    cp $CURRENT/wrapper.sh /opt/djiparsetxt
elif [[ ! -f /opt/djiparsetxt/djiparsetxt ]]; then
    cp /tmp/djiparsetxt/djiparsetxt /opt/djiparsetxt
fi

if [[ ! -f /opt/djiparsetxt/wrapper.sh ]]; then
        cp $CURRENT/wrapper.sh /opt/djiparsetxt
fi

if [[ ! -f ~/.zshrc ]]; then
    echo "export PATH=$PATH:/opt/djiparsetxt" >> ~/.zshrc
    echo "alias log2csv='wrapper.sh $PWD'" >> ~/.zshrc
else
    grep 'export PATH=$PATH:/opt/djiparsetxt' ~/.zshrc >> /dev/null
    if [ ! $? -eq 0 ];then
        echo "export PATH=$PATH:/opt/djiparsetxt" >> ~/.zshrc
    fi
    grep 'alias log2csv='wrapper.sh $PWD'' >> /dev/null
    if [ ! $? -eq 0 ];then
        echo "alias log2csv='wrapper.sh $PWD'" >> ~/.zshrc
    fi
fi
