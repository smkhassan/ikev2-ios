#! /usr/bin/env sh

git clone https://github.com/letsencrypt/letsencrypt ./letsencrypt



./letsencrypt/letsencrypt-auto certonly --standalone --email --preferred-challenges http sami.hassan@vpnmaze.com --agree-tos --no-eff-email -d test.vpnmaze.online

ln -f -s "/etc/letsencrypt/live/test.vpnmaze.online/cert.pem"    /etc/ipsec.d/certs/cert.pem
ln -f -s "/etc/letsencrypt/live/test.vpnmaze.online/privkey.pem" /etc/ipsec.d/private/privkey.pem
ln -f -s "/etc/letsencrypt/live/test.vpnmaze.online/chain.pem"   /etc/ipsec.d/cacerts/chain.pem