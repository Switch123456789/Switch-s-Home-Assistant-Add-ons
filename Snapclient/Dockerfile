ARG BUILD_FROM=ghcr.io/hassio-addons/base-python
FROM ${BUILD_FROM}
RUN echo "Version: 0.13"

#INSTALL PACKAGES (APK)
RUN for r in http://dl-cdn.alpinelinux.org/alpine/edge/main http://dl-cdn.alpinelinux.org/alpine/edge/community; do grep -qxF "$r" /etc/apk/repositories || echo "$r" >> /etc/apk/repositories; done
RUN apk update && apk upgrade --no-cache && apk add --no-cache \
    alsa-plugins-pulse \
    snapcast

#START SCRIPT
RUN rm -R -f "/tmp/"*
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
#CMD [ "/config/run.sh" ]