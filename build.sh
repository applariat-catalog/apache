#! /bin/sh
# appLariats generic Apache build script


#Log everything in /src/build.log
logfile=/code/build.log
exec > $logfile 2>&1
set -x

#check inside code artifact for /code/apache-conf/httpd.conf and use it if exists
#customizing tomcat through providing apache-conf/httpd.conf as part of the code artifact
if [ -e /code/apache-conf/httpd.conf ]
then
 cp -f /code/apache-conf/httpd.conf /usr/local/apache2/conf/httpd.conf
else
 #look inside /conf for httpd.conf and use it if exists
 #customizing apache through cloning this github repo and providing conf/httpd.conf
 if [ -e /conf/httpd.conf ]
 then
  cp -f /conf/httpd.conf /usr/local/apache2/conf/httpd.conf
 fi
 #if non of the above, default config file inside the image will be used
fi

cp -rf /code/* /usr/local/apache2/htdocs/
