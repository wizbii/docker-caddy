FROM golang:alpine as builder

ARG CADDY_VERSION="0.11.4"

RUN apk add --no-cache git

# clone caddy
RUN git clone https://github.com/mholt/caddy -b "v$CADDY_VERSION" /go/src/github.com/mholt/caddy \
    && cd /go/src/github.com/mholt/caddy \
    && git checkout -b "v$CADDY_VERSION"

# import plugins
COPY plugins.go /go/src/github.com/mholt/caddy/caddyhttp/plugins.go

# clone builder
RUN git clone https://github.com/caddyserver/builds /go/src/github.com/caddyserver/builds

# build caddy
RUN cd /go/src/github.com/mholt/caddy/caddy \
    && go get ./... \
    && go run build.go \
    && mv caddy /go/bin && \
    caddy -version && \
    caddy -plugins


FROM scratch

COPY --from=builder /go/bin/caddy /caddy
