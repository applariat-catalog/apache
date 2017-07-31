#! /bin/sh
# appLariats generic Apache build script


#Log everything in /tmp/build.log
logfile=/tmp/build.log
exec > $logfile 2>&1
set -x

#check inside code artifact for /code/apache-conf/httpd.conf and use it if exists
#customizing Apache through providing apache-conf/httpd.conf as part of the code artifact
if [ -e /code/apache-conf/httpd.conf ]
then
 cp -f /code/apache-conf/httpd.conf /usr/local/apache2/conf/httpd.conf
else
 #look inside /conf for httpd.conf and use it if exists
 #customizing Apache through cloning this github repo and providing conf/httpd.conf
 if [ -e /conf/httpd.conf ]
 then
  cp -f /conf/httpd.conf /usr/local/apache2/conf/httpd.conf
 fi
 #if non of the above, default config file inside the image will be used
 echo "Could not find /code/apache-conf/httpd.conf, going to use the default nginx.conf "
fi

cp -rf /code/* /usr/local/apache2/htdocs/

#Cleaning up after ourselves
rm -rf /code
rm -rf /conf