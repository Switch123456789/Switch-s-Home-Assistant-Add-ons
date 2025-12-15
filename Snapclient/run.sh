#!/usr/bin/with-contenv bashio
function cv {
    declare -g "$1=$(bashio::config "$1")"
    if [ "${!1}" = null ]; then
        declare -g "$1=$2"
    fi
}
cv url tcp://127.0.0.1:1704
cv id HomeAssistant
cv latency 0
cv loglevel notice
bashio::log.info "STARTING SNAPCLIENT ..."
snapclient --logfilter=*:${loglevel} --hostID "${id}" --latency "${latency}" "${url}"