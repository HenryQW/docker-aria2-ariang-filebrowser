# docker-aria2-with-ariang

- AriaNg Webui: https://github.com/mayswind/AriaNg

- Force SSL connection, thus requires two SSL certs: web and rpc.

- ENV: RPC_SECRET=[please enter your own token, this is important!!!]

Example:
```
docker run -d \
--name aria2 --restart=always \
-p [rpc port]:6800 -p [web port]:80 \
-v /yourKey.pem:/root/conf/key/key.pem \
-v /yourCert.pem:/root/conf/key/cert.pem \
-e RPC_SECRET=[please enter your own token, this is important!!!] \
wangqiru/aria2-with-ariang
```

Note: rpc over https **does not work** behind CloudFlare, only webui does.
