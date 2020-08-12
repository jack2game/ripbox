sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install p7zip-full
sudo apt-get -y install screen
sudo apt-get -y install nano
sudo curl https://rclone.org/install.sh | sudo bash
mkdir /home/rex_txt/.config/
mkdir /home/rex_txt/.config/rclone/
cp /home/rex_txt/rclone.conf /home/rex_txt/.config/rclone/
#rclone copy remote0_crypt:/ imperial_crypt:/ --verbose
