FROM alpine:edge

ENV GOPATH=/go

RUN apk add go wireguard-tools

RUN go install github.com/serjs/socks5-server@2ada16b7eb7ffc710488f2b7f0bdb4b9ba63371e

ADD run.sh run.sh

EXPOSE 1080

CMD ["sh", "run.sh"]
