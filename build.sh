#! /bin/sh
# appLariats generic Apache build script
# Requirements - A valid httpd.conf file exists within the /src/conf/ dir
# Copies the httpd.conf file from the /src/conf/ and copies it into /usr/local/apache2/conf/

#Log everything in /src/build.log
logfile=/src/build.log
exec > $logfile 2>&1
set -x

#Check for httpd.conf file and throw exception if not present
if [ -e /src/config/httpd.conf ]
then
    cp -f /src/config/httpd.conf /usr/local/apache2/conf/httpd.conf
fi

cp -rf /src/* /usr/local/apache2/htdocs/
