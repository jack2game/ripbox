#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo curl https://rclone.org/install.sh | sudo bash
sudo apt-get -y install python3-pip
sudo apt-get -y install python3-numpy
sudo apt-get -y install ffmpeg
sudo wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | sudo apt-key add -
sudo apt-get -y install mkvtoolnix mkvtoolnix-gui mediainfo
sudo pip3 install --upgrade youtube_dl
sudo pip3 install dottorrent-cli
sudo wget -P /usr/local/bin/ https://raw.githubusercontent.com/jack2game/ripbox/master/jietu
chmod a+x /usr/local/bin/jietu
mkdir /home/webdlbox/
mkdir /home/webdlbox/Workspace/
rclone config file
