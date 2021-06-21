#!/bin/zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install git

cd
cd /tmp
git clone https://github.com/uav4geo/djiparsetxt.git
cd djiparsetxt
make
chmod 755 djiparsetxt

if [[ ! -d /usr/local/opt/djiparsetxt ]]; then
    mkdir /usr/local/opt/djiparsetxt
    cp /tmp/djiparsetxt/djiparsetxt /usr/local/opt/djiparsetxt
elif [[ ! -f /usr/local/opt/djiparsetxt/djiparsetxt ]]; then
    cp /tmp/djiparsetxt/djiparsetxt /usr/local/opt/djiparsetxt
fi 

if [[ ! -d ~/.zshrc ]]; then
    echo "export PATH=$PATH:/usr/local/opt/djiparsetxt" >> ~/.zshrc
else
    grep 'export PATH=$PATH:/usr/local/opt/djiparsetxt' ~/.zshrc >> /dev/null
    if [ ! $? -eq 0 ];then
        echo "export PATH=$PATH:/usr/local/opt/djiparsetxt" >> ~/.zshrc
    fi
fi