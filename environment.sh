sudo apt install -y apache
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt install -y php libapache2-mod-php php-common php-gmp php-curl php-intl php-mbstring php-xmlrpc php-mysql php-gd php-xml php-cli php-zip

echo '127.0.0.1 grav.local' >> /etc/hosts

echo '<VirtualHost *:80>
     ServerAdmin admin@example.com
     DocumentRoot /var/www/html/grav
     ServerName grav.local

     <Directory /var/www/html/grav/>
        Options +FollowSymlinks
        AllowOverride All
        Require all granted
     </Directory>

     ErrorLog ${APACHE_LOG_DIR}/error.log
     CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>' > /etc/apache2/sites-available/grav.conf

sudo a2ensite grav.conf
sudo a2dissite 000-default.conf
sudo a2enmod rewrite

wget https://getgrav.org/download/core/grav-admin/1.7.10 -O /tmp/1.7.10
unzip /tmp/1.7.10 -d /var/www/html/ ; mv /var/www/html/grav-admin /var/www/html/grav ; rm /tmp/1.7.10
sudo chown -R www-data:www-data /var/www/html/grav/
sudo chmod -R 755 /var/www/html/grav/


sudo systemctl enable apache2.service
sudo systemctl restart apache2.service
