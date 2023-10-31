ARG BUILD_FROM
FROM $BUILD_FROM

#UPDATE AND INSTALL PACKAGES
RUN apk update && apk upgrade --no-cache && apk add --no-cache \
    alsa-plugins-pulse \
    gst-plugins-base \
    gst-plugins-good \
    gst-plugins-bad \
    gst-plugins-ugly \
    icecast \
    mailcap \
    mopidy \
    snapcast \
    sudo \
    pwgen \
    py3-pip
    #yt-dlp
RUN pip3 install --no-cache-dir --upgrade \
    mopidy-iris \
    mopidy-local \
    #mopidy-mixcloud \
    mopidy-mobile \
    mopidy-party \
    mopidy-soundcloud \
    mopidy-yap \
    mopidy-youtube \
    ytmusicapi

#WORKAROUND: YT-DLP (non-edge-version lacks new mixcloud API-URL)
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> "/etc/apk/repositories" && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> "/etc/apk/repositories" && \
    apk update && apk add --no-cache yt-dlp

#WORKAROUND: MOPIDY-MIXCLOUD (pip-release is broken, this will install a modified version by nbx3 (github) and me.
COPY files/mopidy-mixcloud /tmp/mopidy-mixcloud
RUN chmod 755 -R /tmp/mopidy-mixcloud && \
    cd /tmp/mopidy-mixcloud && \
    pip3 install . && \
    rm -R /tmp/mopidy-mixcloud

#PREPARE PACKAGES
RUN echo "mopidy ALL=NOPASSWD: /usr/lib/python3.11/site-packages/mopidy_iris/system.sh" >> "/etc/sudoers" && \
    sed -i 's/level = INFO/level = WARNING/' /etc/mopidy/logging.conf && \
    rm "/etc/snapserver.conf" "/etc/icecast.xml" "/etc/mopidy/mopidy.conf" && \
    mv "/etc/mopidy" "/etc/mopidy.default"

#PREPARE SCRIPT
COPY files/run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]