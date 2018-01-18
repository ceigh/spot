#!/bin/bash
confirm=''
echo -e "\033[1m\e[35mInstallation may take a long time, please confirm with Enter\nor ^C to exit\033[0m"
read confirm
if [[ $confirm -eq '' ]]
then
  sudo mkdir /opt/spot > /dev/null 2>&1
  here=`pwd`
  sudo cp -n $here/coinHiveMiner.js $here/logo.txt $here/gateway.txt $here/interface.txt /opt/spot/
  sudo cp -f $here/spot /usr/local/bin/spot
  sudo chmod +x /usr/local/bin/spot
  
  echo -e "\033[1m\e[35mInstallation...\033[0m"
  sudo apt-get update > /dev/null 2>&1
  echo -ne '\n' | sudo apt-get install python-pip > /dev/null 2>&1
  pip install --upgrade pip > /dev/null 2>&1
  echo -ne '\n' | sudo apt-get install git python-dev python-setuptools libpcap0.8-dev libnetfilter-queue-dev libssl-dev libjpeg-dev libxml2-dev libxslt1-dev libcapstone3 libcapstone-dev libxml2-dev libxslt1-dev python-magic > /dev/null 2>&1
  sudo pip install dnslib NetfilterQueue ua-parser user-agents > /dev/null 2>&1
  sudo pip install requests[security] > /dev/null 2>&1

  cd /opt
  sudo git clone https://github.com/byt3bl33d3r/MITMf > /dev/null 2>&1
  cd /opt/MITMf && sudo git submodule init && sudo git submodule update --recursive > /dev/null 2>&1

  sudo pip install -r requirements.txt > /dev/null 2>&1

  echo -ne '\n' | sudo apt-get autoremove > /dev/null 2>&1
  echo -e "\033[1m\e[35mNow you can remove this directory and use spot!\033[0m"
else
  echo -e "\033[1m\e[35mStop\033[0m"
  exit 0
fi
