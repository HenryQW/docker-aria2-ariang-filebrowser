FROM alpine:edge

LABEL AUTHOR = Henry<henry@wangqiru.com>

WORKDIR /root

ENV RPC_SECRET=Henry
ENV RPC_SECURE=false

RUN apk update && apk add wget bash curl openrc gnupg screen aria2 darkhttpd tar --no-cache

ADD conf /root/conf

RUN mkdir -p /usr/local/www && mkdir -p /usr/local/www/aria2

RUN mkdir /usr/local/www/aria2/Download && cd /usr/local/www/aria2 \
    && chmod +rw /root/conf/aria2.session \
    && wget -N --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/0.3.0/aria-ng-0.3.0.zip && unzip aria-ng-0.3.0.zip && rm -rf aria-ng-0.3.0.zip \
    && chmod -R 755 /usr/local/www/aria2 \
    && chmod +x /root/conf/aria2c.sh

VOLUME /root/conf/key

VOLUME /data

EXPOSE 6800 80

ENTRYPOINT ["/bin/sh", "/root/conf/aria2c.sh"]


