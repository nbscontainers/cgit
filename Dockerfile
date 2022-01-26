FROM docker.io/alpine:latest

RUN apk add --no-cache lighttpd cgit git-daemon && \
    echo 'include "cgit.conf"' >> /etc/lighttpd/lighttpd.conf

COPY cgitrc /etc/cgitrc
COPY git-http-backend-proxy /usr/libexec/git-core/git-http-backend-proxy
COPY lighttpd-cgit.conf /etc/lighttpd/cgit.conf

EXPOSE 80
VOLUME /repos

ENTRYPOINT ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
