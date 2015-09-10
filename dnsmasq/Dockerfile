FROM metakungfu/base

RUN apk update \
    && apk-install dnsmasq=2.72-r1 \
                   bash \
                   openrc=0.14-r3 \
    && bnl-apk-install-download-deps \
    && apk-install -t forego_deps git go \
    && export GOPATH=/tmp \
    && go get -u github.com/ddollar/forego \
    && go get -u github.com/jwilder/docker-gen \
    && mv /tmp/bin/* /usr/local/bin/ \
    && apk del download-deps forego_deps \
    && rm -rf /var/cache/apk/* /tmp/*

ENV DOCKER_HOST unix:///var/run/docker.sock

ADD config/dnsmasq.tmpl /etc/dnsmasq.tmpl
ADD config/Procfile ./

EXPOSE 53/udp

CMD ["forego", "start", "-r"]
