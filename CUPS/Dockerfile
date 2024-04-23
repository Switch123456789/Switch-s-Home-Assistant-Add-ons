ARG BUILD_FROM
FROM $BUILD_FROM
RUN echo "Version: 0.9.1"

#UPDATE AND INSTALL PACKAGES
RUN apk update && apk upgrade --no-cache && apk add --no-cache \
    avahi \
    dbus \
    colord \
    cups \
    cups-filters

#PREPARE PACKAGES
RUN mkdir -p /var/run/dbus && \
    rm -r /etc/avahi/services && \
    mv /etc/cups /etc/cups.default && \
    { \
        echo "Listen *:631"; \
        echo "WebInterface Yes"; \
        echo "<Location />"; \
        echo "AuthType None"; \
        echo "Allow all"; \
        echo "</Location>"; \
        echo "<Location /admin>"; \
        echo "AuthType None"; \
        echo "Allow all"; \
        echo "</Location>"; \
        echo "LogLevel error"; \
    } > "/etc/cups.default/cupsd.conf"

#PREPARE SCRIPT
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]