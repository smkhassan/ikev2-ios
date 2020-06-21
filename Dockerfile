FROM ubuntu:16.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install strongswan iptables uuid-runtime ndppd openssl libcharon-extra-plugins \
    && rm -rf /var/lib/apt/lists/* # cache busted 20160406.1

RUN rm /etc/ipsec.secrets
RUN mkdir /config

ADD ./etc/* /etc/

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
COPY ./etc/ca.crt /etc/ipsec.d/cacerts/ca.crt

ADD ./bin/* /usr/bin/

VOLUME /etc
VOLUME /config

# http://blogs.technet.com/b/rrasblog/archive/2006/06/14/which-ports-to-unblock-for-vpn-traffic-to-pass-through.aspx
EXPOSE 500/udp 4500/udp

CMD /usr/bin/start-vpn
