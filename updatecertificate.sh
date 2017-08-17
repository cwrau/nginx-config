#! /bin/bash

#	https://stackoverflow.com/a/246128

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

domainsParameter=""

while read domain; do
	domainsParameter="${domainsParameter} -d ${domain}"
done <${DIR}/domainlist

echo ${domainsParameter}

read -p "Get certificates for those domains? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	service nginx stop
	certbot certonly --standalone --rsa-key-size 4096 $domainsParameter
	service nginx start
fi
