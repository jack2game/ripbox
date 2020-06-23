sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common
sudo apt-get -y install nano
sudo apt update
sudo apt install xfce4 xfce4-goodies
sudo apt -y install tightvncserver
touch ~/.Xresources
vncserver
sleep 5
vncserver -kill :1

cat > ~/.vnc/xstartup <<EOF
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOF

vncserver -geometry 1920x1080
sudo curl https://rclone.org/install.sh | sudo bash
sudo add-apt-repository ppa:stebbins/handbrake-releases -y
sudo apt-get -y update
sudo apt-get -y install handbrake-gtk
sudo apt-get -y install handbrake-cli
sudo apt-get -y install mediainfo-gui
sudo apt-get -y install mediainfo
sudo wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | sudo apt-key add -
sudo apt update
sudo apt -y install mkvtoolnix mkvtoolnix-gui
sudo add-apt-repository ppa:videolan/master-daily -y
sudo apt-get -y update
sudo apt -y install vlc
sudo apt-get -y install mono-complete
sudo apt-get -y install libhunspell-dev
sudo apt-get -y install libmpv-dev
sudo apt-get -y install tesseract-ocr
sudo apt-get -y install ffmpeg
mkdir ~/.config/rclone/
cp ~/rclone.conf ~/.config/rclone/
rclone copy remote1:/RexBackup/EncodeLinux/ ~/Desktop/Encode/ --verbose

cat > ~/subtitleedit.sh <<EOF
#!/bin/bash
mono ~/Encode/SE3516/SubtitleEdit.exe
EOF

sudo apt -y autoremove
