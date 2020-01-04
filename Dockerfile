
FROM alpine:3.11

LABEL maintainer="Pavel Petrov <itnelo@gmail.com>"
LABEL version="0.1.0"
LABEL description="Docker SSH tunnel"

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

ARG LOCAL_HOST=*
ARG LOCAL_PORT

ARG REMOTE_HOST=127.0.0.1
ARG REMOTE_PORT

ARG SSH_TUNNEL_HOST
ARG SSH_TUNNEL_PORT=22
ARG SSH_TUNNEL_USER=root

CMD ssh \
        -p $SSH_TUNNEL_PORT \
        -L $LOCAL_HOST:$LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT \
        $SSH_TUNNEL_USER@$SSH_TUNNEL_HOST \
        -N
