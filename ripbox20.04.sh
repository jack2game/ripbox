#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common
sudo apt-get -y install nano
sudo apt-get -y install expect
sudo apt-get -y install expect-dev
sudo apt update

/usr/bin/expect -c '
set timeout -1
spawn sudo apt -y install xfce4 xfce4-goodies
expect "Country of origin for the keyboard:"
send -- "31\r"
expect "Keyboard layout:"
send -- "1\r"
expect "Default display manager:"
send -- "1\r"
expect eof
'

sudo apt -y install tightvncserver
touch ~/.Xresources
vncserver -kill :1

/usr/bin/expect -c '
set timeout -1
spawn vncserver
expect "Password:"
send -- "99623689\r"
expect "Verify:"
send -- "99623689\r"
expect "Would you like to enter a view-only password (y/n)?"
send -- "n\r"
expect eof
'

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
sudo apt update
sudo apt -y install vlc
sudo apt-get -y install mono-complete
sudo apt-get -y install libhunspell-dev
sudo apt-get -y install libmpv-dev
sudo apt-get -y install tesseract-ocr
sudo apt-get -y install ffmpeg
sudo dpkg --add-architecture i386
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
sudo apt -y install --install-recommends winehq-stable
sudo apt-get -y install libopus-dev libopus0 opus-tools
sudo apt-get -y install fdkaac

mkdir ~/.config/rclone/
cp ~/rclone.conf ~/.config/rclone/
rclone copy remote1:/RexBackup/EncodeLinux/ ~/Desktop/Encode/ --verbose
sudo chmod +x ~/Desktop/Encode/BDSup2Sub512/BDSup2Sub512.jar

sudo apt -y install firefox
sudo apt -y autoremove

/usr/bin/expect -c '
set timeout -1
spawn sudo update-alternatives --config x-terminal-emulator
expect "type selection number:"
send -- "2\r"
expect eof
'
