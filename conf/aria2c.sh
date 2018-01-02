#!/bin/sh
echo "Run aria2c and ariaNG"
/usr/bin/aria2c --conf-path="/root/conf/aria2.conf" -D \
--rpc-secret="$RPC_SECRET" \
&& darkhttpd /usr/local/www/aria2 --port 80
fi
