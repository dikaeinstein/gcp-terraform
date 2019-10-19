#!/bin/bash
set -Eeu

echo " ----- setup environment ----- "
#fix for locale issues when connecting to ubuntu on fresh install
export LANG="en_US.utf8"
export LANGUAGE="en_US.utf8"
export LC_CTYPE="UTF-8"
export LC_ALL="en_US.utf8"
echo

echo " ----- install tightvncserver ----- "
sudo apt-get update
sudo apt-get install -y tightvncserver
echo

echo " ----- install Xfce ----- "
sudo apt-get install -y xfce4 xfce4-goodies
echo

echo " ----- copy unit file for vncserver ----- "
wget https://gist.githubusercontent.com/dikaeinstein/2f7029a9420898d3be4033ac968b3bea/raw/adf3167655f6d40ad273544be6358c8dfc4e0ab4/vncserver@.service
sudo mv vncserver@.service /etc/systemd/system/vncserver@.service
echo

echo " ----- install google chrome ----- "
# Add google chrome ppa
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# Add the ppa url to /etc/apt/sources.list.d/google.list
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install -y google-chrome-stable
sudo apt-get -f install -y #  fix dependency issues
echo

echo " ----- install qbittorrent client ----- "
sudo apt-get install -y qbittorrent
echo
