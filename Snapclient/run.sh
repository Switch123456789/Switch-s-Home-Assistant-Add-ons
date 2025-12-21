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
bashio::log.notice "Starting Snapclient playback from (${url}) ..."
snapclient "${url}" --hostID "${id}" --latency "${latency}" --logfilter=*:${loglevel}