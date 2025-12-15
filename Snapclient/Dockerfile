ARG BUILD_FROM=ghcr.io/hassio-addons/base-python
FROM ${BUILD_FROM}
RUN echo "Version: 0.5"

#INSTALL PACKAGES (APK)
RUN for r in http://dl-cdn.alpinelinux.org/alpine/edge/main http://dl-cdn.alpinelinux.org/alpine/edge/community; do grep -qxF "$r" /etc/apk/repositories || echo "$r" >> /etc/apk/repositories; done
RUN apk update && apk upgrade --no-cache && apk add --no-cache \
    alsa-plugins-pulse \
    snapcast

#RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community

#INSTALL PACKAGE (SNAPWEB)
#RUN wget "https://github.com/badaix/snapweb/releases/download/v0.7.0/snapweb.zip" -P "/tmp" && \
#    rm -R -f "/usr/share/snapserver/snapweb" && \
#    unzip "/tmp/snapweb.zip" -d "/usr/share/snapserver/snapweb"

#PREPARE FILES
RUN rm -R -f "/tmp/"*

#START SCRIPT
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
#CMD [ "/config/run.sh" ]