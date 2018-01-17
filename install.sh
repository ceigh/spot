#!/bin/bash
sudo mkdir /opt/spot
here=`pwd`
sudo cp $here/coinHiveMiner.js /opt/spot/
sudo cp $here/spot /usr/local/bin/
sudo chmod +x /usr/local/bin/spot
sudo apt update
apt-get install python-dev python-setuptools libpcap0.8-dev libnetfilter-queue-dev libssl-dev libjpeg-dev libxml2-dev libxslt1-dev libcapstone3 libcapstone-dev libxml2-dev libxslt1-dev python-dnslib python-magic python-netfilterqueue python-ua-parser python-user-agents
pip install requests[security]
cd /opt
sudo git clone https://github.com/byt3bl33d3r/MITMf
cd MITMf && git submodule init && git submodule update --recursive
pip install -r requirements.txt
echo
echo -e "\033[1m\e[35mNow you can remove this directory and use spot!\033[0m"
echo
