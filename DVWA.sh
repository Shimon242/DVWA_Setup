# DVWA Dependencies
sudo apt update
sudo apt install -y apache2 mariadb-server mariadb-client php php-mysqli php-gd libapache2-mod-php

# DVWA Download and Install
sudo git -c clone https://github.com/digininja/DVWA.git
sudo cp ./DVWA/config/config.inc.php.dist ./DVWA/config/config.inc.php
sudo mkdir -p /var/www/html
sudo cp -r ./DVWA/* /var/www/html
sudo service apache2 start
sudo chown www-data /var/www/html/hackable/uploads
sudo chown www-data /var/www/html/config
sudo sed -i 's/allow_url_include = Off/allow_url_include = On/' /etc/php/7.2/apache2/php.ini

# DVWA Database Creation
sudo mysql -e "create database dvwa"
sudo mysql -e "create user dvwa@localhost identified by 'p@ssw0rd'"
sudo mysql -e "grant all on dvwa.* to dvwa@localhost"
sudo mysql -e "flush privileges"
sudo apachectl restart
