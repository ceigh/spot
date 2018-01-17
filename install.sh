#!/bin/bash
#Add kali repos
sudo apt update
sudo apt install mitmf mitmflib
sudo mkdir /opt/spot
here=`pwd`
sudo cp $here/coinHiveMiner.js /opt/spot/
sudo cp $here/spot /usr/local/bin/
sudo chmod +x /usr/local/bin/spot
echo
echo -e "\033[1m\e[35mNow you can remove this directory and use spot!\033[0m"
echo
