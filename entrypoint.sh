#! /bin/sh
# appLariat generic entrypoint.sh

echo "Printing build log"
cat /tmp/build.log

# Apache gets grumpy about PID files pre-existing
rm -f /usr/local/apache2/logs/httpd.pid

exec httpd -DFOREGROUND