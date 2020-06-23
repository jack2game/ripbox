sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common
sudo apt-get -y install nano
sudo apt-get -y install gnome-shell
sudo apt-get -y install ubuntu-gnome-desktop
sudo apt-get -y install autocutsel
sudo apt-get -y install gnome-core
sudo apt-get -y install gnome-panel
sudo apt-get -y install gnome-themes-standard
sudo apt-get -y install tightvncserver
touch ~/.Xresources
vncserver -kill :1
vncserver
sleep 5
vncserver -kill :1

cat > ~/.vnc/xstartup <<EOF
#!/bin/sh
autocutsel -fork
xrdb $HOME/.Xresources
xsetroot -solid grey
export XKL_XMODMAP_DISABLE=1
export XDG_CURRENT_DESKTOP="GNOME-Flashback:Unity"
export XDG_MENU_PREFIX="gnome-flashback-"
unset DBUS_SESSION_BUS_ADDRESS
gnome-session --session=gnome-flashback-metacity --disable-acceleration-check --debug &amp;
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
mkdir ~/.config/rclone/
cp ~/rclone.conf ~/.config/rclone/
rclone copy remote1:/RexBackup/EncodeLinux/ ~/Desktop/Encode/ --verbose
sudo dpkg --add-architecture i386
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
sudo apt -y install --install-recommends winehq-stable

sudo apt -y autoremove
