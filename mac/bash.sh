#!/bin/sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install git

cd
cd /tmp
git clone https://github.com/uav4geo/djiparsetxt.git
cd djiparsetxt
make
chmod 755 djiparsetxt
cd
mkdir /usr/local/opt/djiparsetxt
mv /tmp/djiparsetxt/djiparsetxt /usr/local/opt/djiparsetxt
echo "export PATH=$PATH:/usr/local/opt/djiparsetxt" >> ./bash_profile
source ~/.bash_profile