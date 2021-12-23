FROM certbot/certbot

ENV domain my.domain.com
ENV email info@my.domain.com

RUN mkdir /root/out

COPY doit.sh /root

ENTRYPOINT ["/bin/sh", "/root/doit.sh"]