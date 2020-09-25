#!/bin/bash

echo 'Start mysql'
service mysql start

if [ -f /usr/share/nextdom/core/config/common.config.php ]; then
        echo 'Nextdom is already install'
else
        echo 'Start Nexdom installation'
        rm -r /usr/share/nextdom
        git clone -b develop https://github.com/NextDom/nextdom-core.git /usr/share/nextdom
        chmod +x /usr/share/nextdom/install/postinst
        ./usr/share/nextdom/install/postinst

        echo 'Granting priviledge to mysql for remote connection'
    mysql --execute="GRANT ALL PRIVILEGES ON *.* TO 'nextdom'@'127.0.0.1' IDENTIFIED BY 'nextdom' WITH GRANT OPTION;"
fi

echo 'All init complete'

echo 'Start apache2'
service apache2 restart
echo 'Start mysql'
service mysql restart