sudo apt-get -y update
sudo apt-get -y upgrade
sudo curl https://rclone.org/install.sh | sudo bash
mkdir /home/rex_txt/.config/rclone/
cp /home/rex_txt/rclone.conf /home/rex_txt/.config/rclone/
rclone copy remote0_crypt:/ imperial_crypt:/ --verbose
