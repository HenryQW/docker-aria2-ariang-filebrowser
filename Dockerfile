FROM alpine:edge

LABEL maintainer="Henry@wangqiru.com"

WORKDIR /root

ENV RPC_SECRET=Henry

RUN apk update && apk add darkhttpd wget bash curl openrc screen aria2 tar --no-cache

ADD conf /root/conf

RUN mkdir -p /usr/local/www && mkdir -p /usr/local/www/aria2


RUN mkdir /usr/local/www/aria2/Download && cd /usr/local/www/aria2 \
    && chmod +rw /root/conf/aria2.session \
    && wget -N --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/0.3.0/aria-ng-0.3.0.zip && unzip *.zip && rm *.zip \
    && chmod -R 755 /usr/local/www/aria2 \
    && chmod +x /root/conf/aria2c.sh 


VOLUME /root/conf
VOLUME /data

EXPOSE 6800 80

ENTRYPOINT ["/bin/sh", "/root/conf/aria2c.sh"]
# CMD ["/bin/sh", "/root/aria2c.sh" ]
