#!/usr/bin/with-contenv bashio
# PREPARATIONS ##################################################################
    bashio::log.info "Checking configuration-files ..."
    if [ ! -d "/config/cups" ]; then
        bashio::log.notice "No CUPS configuration-files found, using defaults ..."
        cp -p -r "/etc/cups.default" "/config/cups"
    fi
    ln -s "/config/cups" "/etc"
    if [ ! -d "/config/avahi" ]; then
        bashio::log.notice "No avahi configuration-files found, using defaults ..."
        cp -p -r "/etc/avahi.default" "/config/avahi"
    fi
    ln -s "/config/avahi" "/etc"
    cupsd -t
# START CUPS ####################################################################
    bashio::log.info "Starting services ..."
    dbus-daemon --system
    avahi-daemon -D
    sleep 5
    bashio::log.info "Starting CUPS ..."
    cupsd -f
    bashio::log.info "Shutting down ..."
