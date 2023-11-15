ARG BUILD_FROM=ghcr.io/hassio-addons/base-python
FROM ${BUILD_FROM}

#UPDATE AND INSTALL PACKAGES
RUN apk update && apk upgrade --no-cache && apk add --no-cache \
    alsa-plugins-pulse \
    gst-plugins-base \
    gst-plugins-good \
    gst-plugins-bad \
    gst-plugins-ugly \
    icecast \
    mailcap \
    snapcast \
    sudo \
    pwgen \
    py3-pip

#INSTALL EDGE PACKAGES
RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
    mopidy \
    yt-dlp

RUN pip3 install --no-cache-dir --upgrade \
    mopidy-iris \
    mopidy-local \
#   mopidy-mixcloud \
    mopidy-mobile \
    mopidy-soundcloud \
    mopidy-yap \
#   mopidy-youtube \
    ytmusicapi

#WORKAROUND: MOPIDY-MIXCLOUD (Fork: Switch123456789.
RUN wget "https://github.com/Switch123456789/unusualcomputers/archive/refs/heads/master.zip" -P "/tmp" && \
    unzip "/tmp/master.zip" "unusualcomputers-master/code/mopidy/mopidymixcloud/*" -d "/tmp" && \
    cd "/tmp/unusualcomputers-master/code/mopidy/mopidymixcloud" && \
    pip3 install .

#WORKAROUND: MOPIDY-YOUTUBE (Branch: develop)
RUN wget "https://github.com/natumbri/mopidy-youtube/archive/refs/heads/develop.zip" -P "/tmp" && \
    unzip "/tmp/develop.zip" -d "/tmp" && \
    cd "/tmp/mopidy-youtube-develop" && \
    pip3 install .

#PREPARE FILES
RUN echo "mopidy ALL=NOPASSWD: /usr/lib/python3.11/site-packages/mopidy_iris/system.sh" >> "/etc/sudoers" && \
    sed -i 's/level = INFO/level = WARNING/' /etc/mopidy/logging.conf && \
    rm "/etc/snapserver.conf" "/etc/icecast.xml" "/etc/mopidy/mopidy.conf" && \
    mv "/etc/mopidy" "/etc/mopidy.default"

#PREPARE SCRIPT
COPY run.sh /
RUN chmod a+x /run.sh && rm -R /tmp/*
CMD [ "/run.sh" ]