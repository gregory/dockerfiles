FROM gliderlabs/alpine:3.1

MAINTAINER Gregory Horion <public+dockerfiles@gregory.io>

ENV WORKDIR /usr/src/app
WORKDIR /usr/src/app

COPY repositories /etc/apk/repositories

COPY bin/ /usr/local/bin/

RUN mkdir -p $WORKDIR \
    && addgroup app \
    && adduser -G app -h $WORKDIR -s /sbin/nologin -D app \
    && apk-install ca-certificates=20141019-r1

CMD ["/bin/sh"]
