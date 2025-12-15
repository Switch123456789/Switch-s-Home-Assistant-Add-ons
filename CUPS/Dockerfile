ARG BUILD_FROM
FROM $BUILD_FROM
RUN echo "Version: 0.10"

#UPDATE AND INSTALL PACKAGES
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update && apk upgrade --no-cache && apk add --no-cache \
    avahi \
    dbus \
    colord \
    cups \
    brlaser

#PREPARE PACKAGES
RUN mkdir -p /var/run/dbus && \
    rm -r /etc/avahi/services && \
    sed -i "s/use-ipv6=yes/use-ipv6=no/" "/etc/avahi/avahi-daemon.conf" && \
    { \
        echo "Listen 0.0.0.0:631"; \
        echo "WebInterface Yes"; \
        echo "<Location />"; \
        echo "Order allow,deny"; \
        echo "Allow @LOCAL"; \
        echo "</Location>"; \
        echo "<Location /admin>"; \
        echo "Order allow,deny"; \
        echo "Allow @LOCAL"; \
        echo "</Location>"; \
        echo "LogLevel error"; \
    } > "/etc/cups/cupsd.conf" && \
    mv /etc/avahi /etc/avahi.default && \
    mv /etc/cups /etc/cups.default

#START SCRIPT
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
#CMD [ "/config/run.sh" ]