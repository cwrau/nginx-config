# nginx-config

nginx config files for my server

With the fun addition of a PowerShell Rick Rolling script

This configuration ensures A+ rating with 100/100/100/100 and without blacklisted ciphers for http/2 on [Qualys SSL Labs](https://www.ssllabs.com/ssltest/analyze.html?d=cwrcoding.com) (as of 2017-08-28)

This configuration uses automated ECDSA certificate from Let's Encrypt via Alexey Samoshkins [docker-letsencrypt-certgen Docker image](https://hub.docker.com/r/asamoshkin/letsencrypt-certgen)

If you have any questions regarding nginx setup, Let's Encrypt certificates and so on I'd be glad to help, just contact me via [Twitter @CWRau](https://twitter.com/CWRau) or via [email cwrau@cwrcoding.com](mailto:cwrau@cwrcoding.com), both preferably pgp signed and encrypted to [my key](https://keybase.io/cwrau).
___

The crontabs I use to keep the repo up to date and renew the Let's Encrypt certificates is;

```bash
0 0 */15 * * cd /websites/nginx-config && ./updatesslcerts.sh 0
* * *    * * cd /websites/nginx-config && [ ! -f pause ] && ( /usr/bin/git fetch --all && bash needs_pull.sh && ( git clean -fd && git reset origin/master --hard && docker-compose exec -T nginx nginx -s reload ) )
```
