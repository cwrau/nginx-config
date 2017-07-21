# nginx-config
nginx config files for my server

This configuration ensures A+ rating with 100/100/100/100 on [Qualys SSL Labs](https://www.ssllabs.com/ssltest/analyze.html?d=cwrcoding.com) (as of 2017-07-21)

My setup even handles http/2 on CentOS 7 with the help of the [Exove CentOS yum Repository](https://packages.exove.com/)

If you have any questions regarding nginx setup, Let's Encrypt certificates and so on I'd be glad to help, just contact me via [Twitter @CWRau](https://twitter.com/CWRau) or via [email cwrau@cwrcoding.com](mailto:cwrau@cwrcoding.com), both preferably pgp signed and encrypted to [my key](https://keybase.io/cwrau).
___

The crontab I use to autoupdate the nginx config and the website is;

```bash
*/1 * * * * su -s /bin/sh root -c 'cd /websites/cwrcoding.com && [ ! -f pause ] && /usr/bin/git fetch --all && /usr/bin/git reset --hard origin/master && chown -R nginx:nginx /websites'
*/1 * * * * su -s /bin/sh root -c 'cd /websites/nginx-config && [ ! -f pause ] && /usr/bin/git fetch --all && /usr/bin/git reset --hard origin/master && chown -R nginx:nginx /websites && /usr/sbin/nginx -s reload'
```
