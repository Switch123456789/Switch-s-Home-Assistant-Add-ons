#!/usr/bin/with-contenv bashio
ulimit -n 1048576 #fix

# PREPARATIONS ##################################################################
    bashio::log.info "PREPARING CUPS ..."
        if [ ! -d "/data/cups" ]; then
            bashio::log.notice "NO CONFIGURATION FOUND, USING DEFAULTS!"
            cp -p -r "/etc/cups.default" "/data/cups"
        fi
        ln -s "/data/cups" "/etc"
#################################################################################


# START CUPS ####################################################################
    #RESET CONFIGURATION
        if [ "$(bashio::config 'on_startup')" = "Reset configuration" ]; then bashio::log.info "RESETTING CONFIGURATION ..."
            cp -p "/etc/cups.default/cupsd.conf" "/data/cups"
    #RESET CUPS
        elif [ "$(bashio::config 'on_startup')" = "Reset CUPS" ]; then bashio::log.info "RESETTING CUPS ..."
            rm -r "/etc/cups/"* && cp -p -r "/etc/cups.default/"* "/data/cups"
    #START CUPS
        else bashio::log.info "STARTING SERVICES ..."
            dbus-daemon --system
            avahi-daemon -D
            sleep 5
            bashio::log.info "CHECKING CONFIGURATION-FILES ..."
            cupsd -t
            bashio::log.info "STARTING CUPS ..."
            cupsd -f
        fi
            bashio::log.info "ADDON STOPPED!"
