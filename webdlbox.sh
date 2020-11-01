#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo curl https://rclone.org/install.sh | sudo bash
sudo apt-get -y install python3-pip
sudo apt-get -y install python3-numpy
sudo apt-get -y install ffmpeg
sudo apt-get -y install screen
sudo apt-get -y install zip
sudo apt-get -y install unzip
sudo wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | sudo apt-key add -
sudo apt-get -y install mkvtoolnix mkvtoolnix-gui mediainfo
sudo pip3 install --upgrade youtube_dl
sudo pip3 install --upgrade dottorrent-cli
sudo pip3 install --upgrade bubblegum
sudo pip3 install --upgrade pyupload
sudo pip3 install --upgrade imgbox-cli
sudo wget -P /usr/local/bin/ https://raw.githubusercontent.com/jack2game/ripbox/master/jietu
chmod a+x /usr/local/bin/jietu
mkdir /home/webdlbox/
sudo wget -P /home/webdlbox/ https://github.com/jack2game/ripbox/raw/master/rclone21.zip
unzip /home/webdlbox/rclone21.zip -d /usr/local/bin/
chmod a+x /usr/local/bin/rclone21
mkdir /home/webdlbox/Workspace/
rclone config file
