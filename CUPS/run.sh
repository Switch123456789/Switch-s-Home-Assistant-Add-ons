#!/usr/bin/with-contenv bashio
# PREPARATIONS ##################################################################
    bashio::log.info "CHECKING CONFIGURATION-FILES ..."
    if [ ! -d "/config/cups" ]; then
        bashio::log.notice "NO CUPS CONFIGURATION FOUND, USING DEFAULTS!"
        cp -p -r "/etc/cups.default" "/config/cups"
    fi
    ln -s "/config/cups" "/etc"
    if [ ! -d "/config/avahi" ]; then
        bashio::log.notice "NO AVAHI CONFIGURATION FOUND, USING DEFAULTS!"
        cp -p -r "/etc/avahi.default" "/config/avahi"
    fi
    ln -s "/config/avahi" "/etc"
    cupsd -t
# START CUPS ####################################################################
    bashio::log.info "STARTING SERVICES ..."
    dbus-daemon --system
    avahi-daemon -D
    sleep 5
    bashio::log.info "STARTING CUPS ..."
    cupsd -f
    bashio::log.info "ADDON STOPPED!"
