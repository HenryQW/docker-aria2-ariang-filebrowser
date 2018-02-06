# docker-aria2-with-ariang

- AriaNg Webui: https://github.com/mayswind/AriaNg

- Filebrowser (aka filemanager): https://github.com/filebrowser/filebrowser


Get started:
```
docker run -d \
--name aria --restart=always \
-p [rpc port]:6800 -p [web port]:80 \
-v /yourKey:/root/conf/key/key.key \
-v /yourCert:/root/conf/key/cert.crt \
-e RPC_SECRET=[please enter your own token, this is important!!!] \
-e RPC_SECURE=[true|false] \
wangqiru/aria2-with-ariang
```

List of env:
- RPC_SECRET = [please enter your own token, this is important!!!], default [henry].
- RPC_SECURE = [true | false], default [false]. This enables SSL for aria2 RPC.

---
## Filebrowser

`docker-compose.yml` contains the configuration to add [filebrowser](https://github.com/filebrowser/filebrowser) to extend your downloader's capability.

```
docker-compose up -d
```

and you are good to go.

---
For Docker please refer to [https://docs.docker.com](https://docs.docker.com)