#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common
sudo apt-get -y install nano
sudo apt-get -y install expect
sudo apt-get -y install expect-dev
sudo apt-get -y install autocutsel
sudo apt -y update
sudo apt -y upgrade

## Install desktop
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

## Install vncserver
sudo apt -y install tightvncserver
touch ~/.Xresources
vncserver -kill :1

/usr/bin/expect -c '
set timeout -1
spawn vncserver
expect "Password:"
send -- "12345678\r"
expect "Verify:"
send -- "12345678\r"
expect "Would you like to enter a view-only password (y/n)?"
send -- "n\r"
expect eof
'

sleep 5
vncserver -kill :1

cat > ~/.vnc/xstartup <<EOF
#!/bin/bash
autocutsel -fork
xrdb $HOME/.Xresources
startxfce4 &
EOF

vncserver -geometry 1920x1080

sudo curl https://rclone.org/install.sh | sudo bash

## Install handbrake
sudo add-apt-repository ppa:stebbins/handbrake-releases -y
sudo apt-get -y install handbrake-gtk
sudo apt-get -y install handbrake-cli

## Install media info
sudo apt-get -y install mediainfo-gui
sudo apt-get -y install mediainfo

## Install mkvtoolnix
sudo wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | sudo apt-key add -
sudo apt -y install mkvtoolnix mkvtoolnix-gui

## Install vlc
sudo add-apt-repository ppa:videolan/master-daily -y
sudo apt -y install vlc

## Install some dependensies
sudo apt-get -y install mono-complete
sudo apt-get -y install libhunspell-dev
sudo apt-get -y install libmpv-dev
sudo apt-get -y install tesseract-ocr
sudo apt-get -y install ffmpeg

## Install wine
sudo dpkg --add-architecture i386
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
sudo apt -y install --install-recommends winehq-stable

## Install some audio codec
sudo apt-get -y install libopus-dev libopus0 opus-tools
sudo apt-get -y install fdkaac

## Install mkv-extractor-gui
sudo add-apt-repository ppa:hizo/mkv-extractor-gui
sudo apt-get update
sudo apt-get install mkv-extractor-gui

## Grab Encode Software
mkdir ~/.config/rclone/
cp ~/rclone.conf ~/.config/rclone/
rclone copyto 'remote0:/RexShare/Encode/Encode.7z' ~/Desktop/Encode.7z --verbose
7z x ~/Desktop/Encode.7z
rm ~/Desktop/Encode.7z

sudo apt -y install firefox

## Clean Up
sudo apt -y autoremove

## Change Default Terminal
/usr/bin/expect -c '
set timeout -1
spawn sudo update-alternatives --config x-terminal-emulator
expect "type selection number:"
send -- "2\r"
expect eof
'
