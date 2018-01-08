#!/bin/bash
STAGING=${1:-1}
sslPath="../tmp"
acmeVolume="acme_staging"
letsencryptVolume="letsencrypt_staging"

if [ "$STAGING" = 0 ]
then
    sslPath="../ssl"
    acmeVolume="acme"
    letsencryptVolume="letsencrypt"
fi

dockerOutput=$(docker run -v $(realpath "$sslPath"):/var/ssl -v $acmeVolume:/etc/acme -v acme_challenge:/var/acme_challenge_webroot -v $letsencryptVolume:/etc/letsencrypt -v $(realpath ./domains.txt):/etc/domains.txt -e RSA_KEY_LENGTH=4096 -e ECDSA_KEY_LENGTH=ec-384 -e MUST_STAPLE=1 -e CHALLENGE_MODE=webroot -e DOMAINS=/etc/domains.txt -e STAGING=$STAGING asamoshkin/letsencrypt-certgen renew 2>&1)

echo -e "$dockerOutput"

if echo -e "$dockerOutput" | grep -q -v "Cert not yet due for renewal" && false
then
    if [ "$STAGING" = 0 ]
    then
        docker-compose exec -T nginx nginx -s reload
    fi
fi
