# docker-aria2-with-ariang

- AriaNg Webui: https://github.com/mayswind/AriaNg

- ENV: RPC_SECRET=[please enter your own token, this is important!!!]

- ENV: RPC_SECURE=[true|false], default [false]. This enables SSL for aria2 RPC.

Example:
```
docker run -d \
--name aria2 --restart=always \
-p [rpc port]:6800 -p [web port]:80 \
-v /yourKey:/root/conf/key/key.key \
-v /yourCert:/root/conf/key/cert.crt \
-e RPC_SECRET=[please enter your own token, this is important!!!] \
-e RPC_SECURE=[true|false] \
wangqiru/aria2-with-ariang
```