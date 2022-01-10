#!/bin/sh

date=$(date '+%Y-%m-%d')
out_dir="/root/out/$domain/$date"

echo date: $date
echo domain: $domain, *.$domain
echo email: $email

certbot certonly --manual --preferred-challenges=dns --email $email --agree-tos -d *.$domain -d $domain

mkdir -p /root/out/$domain/$date

cp /etc/letsencrypt/live/$domain/fullchain.pem $out_dir/fullchain.pem
cp /etc/letsencrypt/live/$domain/privkey.pem $out_dir/privkey.pem
cp /etc/letsencrypt/live/$domain/cert.pem $out_dir/cert.pem

openssl pkcs12 -export -out $out_dir/cert.pfx -inkey $out_dir/privkey.pem -in $out_dir/cert.pem -certfile $out_dir/fullchain.pem