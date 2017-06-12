# nginx-config
nginx config files for my server

This configuration ensures A+ rating on [Qualys SSL Labs](https://www.ssllabs.com/ssltest/analyze.html?d=cwrcoding.com) (as of 2017-06-13)

If you have any questions regarding nginx setup, Let's Encrypt certificates and so on I'd be glad to help, just contact me.
___

The crontab I use to autoupdate the nginx config and the website is;

```bash
*/1 * * * * su -s /bin/sh root -c 'cd /websites/cwrcoding.com && [ ! -f pause ] && /usr/bin/git fetch --all && /usr/bin/git reset --hard origin/master && chown -R nginx:nginx /websites'
*/1 * * * * su -s /bin/sh root -c 'cd /websites/nginx-config && [ ! -f pause ] && /usr/bin/git fetch --all && /usr/bin/git reset --hard origin/master && chown -R nginx:nginx /websites && /usr/sbin/nginx -s reload'
```
