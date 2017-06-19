#! /bin/sh
# appLariats generic tomcat build script
# Requirements - A valid war file exists within the code_dir
# Copies the war file from the code_dir and copies it into /usr/local/tomcat/webapps

#TO DO - Add an if to check for file and throw error if not present

if [ -e $artifact_root/src/httpd.conf ]
then
    cp -f $artifact_root/src/httpd.conf /usr/local/apache2/conf/httpd.conf
fi

cp -f $artifact_root/src/ /usr/local/apache2/htdocs/
