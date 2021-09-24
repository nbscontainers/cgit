FROM docker.io/alpine:3.14

RUN apk add --no-cache lighttpd cgit && \
    echo 'include "cgit.conf"' >> /etc/lighttpd/lighttpd.conf

COPY cgitrc /etc/cgitrc
COPY lighttpd-cgit.conf /etc/lighttpd/cgit.conf

EXPOSE 80
VOLUME /repos

ENTRYPOINT ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
