ARG BUILD_FROM=ghcr.io/hassio-addons/base-python
FROM ${BUILD_FROM}
RUN echo "Version: 0.9"

#INSTALL PACKAGES (APK)
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
    py3-pip \
    yt-dlp

#INSTALL PACKAGES (PIP3)
RUN pip3 install --break-system-packages --no-cache-dir --upgrade \
    mopidy-iris \
    mopidy-local \
    mopidy-mobile \
    mopidy-soundcloud \
    mopidy-yap \
    ytmusicapi
#   mopidy-mixcloud
#   mopidy-youtube

#INSTALL PACKAGE (SNAPWEB)
RUN wget "https://github.com/badaix/snapweb/releases/download/v0.7.0/snapweb.zip" -P "/tmp" && \
    rm -R -f "/usr/share/snapserver/snapweb" && \
    unzip "/tmp/snapweb.zip" -d "/usr/share/snapserver/snapweb"

#WORKAROUND: MOPIDY-MIXCLOUD (Fork: Switch123456789.
RUN wget "https://github.com/Switch123456789/unusualcomputers/archive/refs/heads/master.zip" -P "/tmp" && \
    unzip "/tmp/master.zip" "unusualcomputers-master/code/mopidy/mopidymixcloud/*" -d "/tmp" && \
    cd "/tmp/unusualcomputers-master/code/mopidy/mopidymixcloud" && \
    pip3 install --break-system-packages .

#WORKAROUND: MOPIDY-YOUTUBE (Branch: develop)
RUN wget "https://github.com/natumbri/mopidy-youtube/archive/refs/heads/develop.zip" -P "/tmp" && \
    unzip "/tmp/develop.zip" -d "/tmp" && \
    cd "/tmp/mopidy-youtube-develop" && \
    pip3 install --break-system-packages .

#PREPARE FILES
RUN echo "mopidy ALL=NOPASSWD: /usr/lib/python3.11/site-packages/mopidy_iris/system.sh" >> "/etc/sudoers" && \
    sed -i "s/level = INFO/level = WARNING/" "/etc/mopidy/logging.conf" && \
    mv "/etc/mopidy" "/etc/mopidy.default" && \
    rm -R -f "/tmp/"* "/etc/snapserver.conf" "/etc/icecast.xml" "/etc/mopidy/mopidy.conf" 

#START SCRIPT
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
#CMD [ "/config/run.sh" ]