
FROM alpine:3.11

LABEL maintainer="Pavel Petrov <itnelo@gmail.com>"
LABEL version="0.1.0"
LABEL description="A simple SSH tunnel for port forwarding within Docker environment"

ENV LOCAL_HOST *
ENV LOCAL_PORT _

ENV REMOTE_HOST 127.0.0.1
ENV REMOTE_PORT _

ENV SSH_TUNNEL_HOST _
ENV SSH_TUNNEL_PORT 22
ENV SSH_TUNNEL_USER root

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

COPY docker-ssh-tunnel-cmd.sh /usr/local/bin/docker-ssh-tunnel-cmd.sh

CMD ["docker-ssh-tunnel-cmd.sh"]
