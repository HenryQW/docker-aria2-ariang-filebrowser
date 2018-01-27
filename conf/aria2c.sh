#!/bin/sh
if [ "$RPC_SECURE" = "true" ]; then
echo "Start aria2 with secure config"

/usr/bin/aria2c --conf-path="/root/conf/aria2.conf" -D  \
--rpc-certificate=/root/conf/key/aria2.crt \
--rpc-private-key=/root/conf/key/aria2.key \
--rpc-secret="$RPC_SECRET" --rpc-secure

else
echo "Start aria2 with standard mode"
/usr/bin/aria2c --conf-path="/root/conf/aria2.conf" -D  \
--rpc-secret="$RPC_SECRET"
fi

darkhttpd /usr/local/www/aria2 --port 80