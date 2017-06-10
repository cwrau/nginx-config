# nginx-config
nginx config file for my server

The crontab I use to autoupdate the nginx config and the website is;
*/1 * * * * su -s /bin/sh root -c 'cd /websites/cwrcoding.com && [ ! -f pause ] && /usr/bin/git fetch --all && /usr/bin/git reset --hard origin/master'
*/1 * * * * su -s /bin/sh root -c 'cd /websites/nginx-config && [ ! -f pause ] && /usr/bin/git fetch --all && /usr/bin/git reset --hard origin/master && /usr/sbin/nginx -s reload'
