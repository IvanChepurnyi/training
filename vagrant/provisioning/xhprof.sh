#!/bin/bash

apt-get install php-pear php5-dev graphviz -y -q
pecl -q channel-update -f pecl.php.net
pecl -q install -f xhprof

echo "extension=xhprof.so" > /etc/php5/conf.d/xhprof.ini
echo "auto_prepend_file=/data/web/xhprof/prepend.php" >> /etc/php5/conf.d/xhprof.ini

# remove php ini memory limit, as we don't want to have cli limited
sed -i'' '/memory_limit[\t ]*=[\t ]*[0-9]\+[a-zA-Z]*/d' /etc/php5/conf.d/magweb.ini
service php5-fpm restart

if [ ! -d /data/web/xhprof ]
then
    wget -O /data/web/xhprof.tgz 'https://www.dropbox.com/s/z7mya52qve24cyj/xhprof.tgz?dl=1'
    tar -xzf /data/web/xhprof.tgz -C /data/web
    rm /data/web/xhprof.tgz
    chown ${VAGRANT_USER}:${VAGRANT_GROUP} -R /data/web/xhprof
fi

if [ ! -L /data/web/staging ]
then
    rmdir /data/web/staging
    ln -s /data/web/xhprof/xhprof_html /data/web/staging
    chown ${VAGRANT_USER}:${VAGRANT_GROUP} /data/web/staging
fi



