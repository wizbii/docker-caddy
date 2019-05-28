FROM golang:alpine as builder

RUN apk add --no-cache git

# TODO: modules should be the default in Go 1.13, so this won't be needed
ENV GO111MODULE on

WORKDIR /usr/src/app

COPY main.go .

RUN go mod init caddy && CGO_ENABLED=0 GOOS=linux go install -a -ldflags '-extldflags "-static"'


FROM alpine

COPY --from=builder /go/bin/caddy /caddy

RUN /caddy -version && /caddy -plugins && ln -s /caddy /usr/local/bin/caddy

CMD ["caddy"]
