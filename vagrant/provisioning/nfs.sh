#!/bin/bash

user=${VAGRANT_USER}
group=${VAGRANT_GROUP}
uid=${VAGRANT_UID}
gid=${VAGRANT_GID}
homedir=$(getent passwd $user | cut -d ':' -f6)
[ -d "$homedir/public/app" ] || rm -rf $homedir/public/*
[ -f "/usr/local/bin/composer" ] || php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer
sudo ufw disable
sudo service nginx stop
sudo service php5-fpm stop
sudo service hhvm stop
sudo usermod -u $uid $user
sudo usermod -g $gid $user
sudo service nginx start
sudo service php5-fpm start
sudo service hhvm start
sudo service nfs-kernel-server restart



