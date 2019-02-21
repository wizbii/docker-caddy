# Wizbii Caddy docker image

This image only contains the caddy binary under `/caddy`, it's meant to be used in a multistage Dockerfile: 

```Dockerfile
FROM alpine

COPY --from=wizbii/caddy /caddy /usr/local/bin/caddy

CMD ["caddy"]
```
