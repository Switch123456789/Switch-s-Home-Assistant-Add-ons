#!/usr/bin/with-contenv bashio
# FUNCTIONS #####################################################################
    #VARIABLES
        function cv {
            declare -g "$1=$(bashio::config "$1")"
            if [ "${!1}" = null ]; then
                declare -g "$1=$2"
            fi
        }
#################################################################################



# PREPARATIONS ##################################################################
    bashio::log.info "CHECKING CONFIGURATION ..."
    #OUTPUTS
        cv output_local false
        cv output_snapcast false
        cv output_icecast false
        if [ ${output_local} = false ] && [ ${output_snapcast} = false ] && [ ${output_icecast} = false ]; then
            bashio::log.error "AT LEAST ONE AUDIO-OUTPUT REQUIRED! (LOCAL, SNAPCAST AND ICECAST)"; exit 1
        fi
    #SOUNDCLOUD
        cv source_soundcloud false
        cv source_soundcloud_token ""
        if [ ${source_soundcloud} = true ] && [ ! ${source_soundcloud_token} ]; then
            bashio::log.error "SOUNDCLOUD AUTH-TOKEN REQUIRED!"
            exit 1
        fi
    #FILESYSTEM
        if [ ! -d "/data/mopidy" ]; then
            bashio::log.notice "NO CONFIGURATION FOUND, USING DEFAULTS!"
            cp -p -r "/etc/mopidy.default" "/data/mopidy"
        fi
        ln -s "/data/mopidy" "/etc"
#################################################################################



# ICECAST #######################################################################
    if [ "${output_icecast}" = true ]; then bashio::log.info "STARTING ICECAST ..."
    #CONFIGURATION
        {
            cv output_icecast_clients 8
            cv output_icecast_queue 524288
            output_icecast_password=$(pwgen 32 1)
            mopidy_output+=" t. ! queue ! lamemp3enc target=bitrate cbr=true bitrate=320 encoding-engine-quality=high ! shout2send async=false mount=mopidy ip=127.0.0.1 port=8000 password=${output_icecast_password}"
            echo "<icecast>"
            echo "    <location>mopidy</location>"
            echo "    <admin>mopidy</admin>"
            echo "    <hostname>127.0.0.1</hostname>"
            echo "    <fileserve>0</fileserve>"
            echo "    <limits>"
            echo "        <clients>${output_icecast_clients}</clients>"
            echo "        <sources>1</sources>"
            echo "        <queue-size>${output_icecast_queue}</queue-size>2"
            echo "    </limits>"
            echo "    <authentication>"
            echo "        #<listen-socket>"
            echo "        #    <port>8443</port>"
            echo "        #    <ssl>1</ssl>"
            echo "        #</listen-socket>"
            echo "        <source-password>${output_icecast_password}</source-password>"
            echo "    </authentication>"
            echo "    <paths>"
            echo "        <logdir>/var/log/icecast</logdir>"
            echo "        #<ssl-certificate>/usr/share/icecast/icecast.pem</ssl-certificate>"
            echo "    </paths>"
            echo "    <logging>"
            echo "        <loglevel>2</loglevel>"
            echo "    </logging>"
            echo "    <security>"
            echo "        <changeowner>"
            echo "            <user>icecast</user>"
            echo "            <group>icecast</group>"
            echo "        </changeowner>"
            echo "    </security>"
            echo "</icecast>"
        } > "/etc/icecast.xml"
    #START
        icecast -c "/etc/icecast.xml" &
    fi
#################################################################################



# SNAPCAST ######################################################################
    if [ "${output_snapcast}" = true ]; then bashio::log.info "STARTING SNAPCAST ..."
    #CONFIGURATION
        { 
            cv output_snapcast_sources ""
            cv output_snapcast_buffer 1
            mopidy_output+=" t. ! queue ! filesink location=/tmp/snapfifo"
            echo "[server]"
            echo "datadir = /etc/mopidy/snapserver"
            echo "[http]"
            echo "#host ="
            echo "bind_to_address = ::"
            echo "doc_root = /usr/share/snapserver/snapweb"
            echo "[tcp]"
            echo "bind_to_address = ::"
            echo "[stream]"
            echo "bind_to_address = ::"
            echo "source = pipe:///tmp/snapfifo?name=Mopidy"
            for i in ${output_snapcast_sources[@]}; do echo "source = $i"; done
            echo "buffer = $((output_snapcast_buffer * 1000))"
            echo "chunk_ms = 26"
            echo "[logging]"
            echo "filter = *:fatal"
        } > "/etc/snapserver.conf"
    #START
        snapserver -c "/etc/snapserver.conf" &
        if [ ${output_local} = true ]; then snapclient --logfilter *:fatal -h 127.0.0.1 & fi
    elif [ "${output_local}" = true ]; then mopidy_output+=" t. ! queue ! autoaudiosink"; fi
#################################################################################



# MOPIDY ########################################################################
    bashio::log.info "PREPARING MOPIDY ..."
    #CONFIGURATION
        {
        #MOPIDY
            cv mopidy_restore false
            cv mopidy_buffer 1
            cv mopidy_results_online 10
            cv source_local false
            cv source_youtube false
            cv source_mixcloud false
            cv interface_iris false
            cv interface_yap false
            cv interface_mobile false
            echo "[core]"
            echo "cache_dir = /etc/mopidy/cache"
            echo "config_dir = /etc/mopidy/config"
            echo "data_dir = /etc/mopidy/data"
            echo "restore_state = ${mopidy_restore}"
            echo "[http]"
            echo "hostname = ::"
            echo "#port = 8099"
            echo "zeroconf = Home Assistant Mopidy Addon"
            echo "allowed_origins = 0.0.0.0"
            echo "[stream]"
            echo "timeout = 10000"
            echo "[audio]"
            echo "output = audioresample ! audioconvert ! audio/x-raw,rate=48000,channels=2,format=S16LE ! tee name=t${mopidy_output}"
            echo "buffer_time = $((mopidy_buffer * 1000))"
            echo "[proxy]"
            echo "scheme = https"
        #LOCAL
            if [ ${source_local} = true ]; then
                cv mopidy_results_local 1000
                cv source_local_dir_music "/media"
                cv source_local_dirs "/media|Media /share|Share"
                cv source_local_include ".aac .aiff .alac .flac .m4a .mp3 .oga .ogg .opus .wma .wav"
                cv source_local_exclude ""  
                cv source_local_dir_playlists "/media"
                cv source_local_timeout 10
                echo "[local]"
                echo "max_search_results = ${mopidy_results_local}"
                echo "media_dir = ${source_local_dir_music}"
                echo "scan_timeout = $((source_local_timeout*1000))"
                echo "scan_follow_symlinks = true"
                echo "included_file_extensions ="
                for i in ${source_local_include[@]}; do echo "    $i"; done
                echo "excluded_file_extensions ="
                for i in ${source_local_exclude[@]}; do echo "    $i"; done
                echo "timeout = ${source_local_timeout}"
                echo "[file]"
                echo "media_dirs ="
                for i in ${source_local_dirs[@]}; do echo "    $i"; done
                echo "follow_symlinks = true"
                echo "metadata_timeout = $((source_local_timeout*1000))"
                echo "[m3u]"
                echo "base_dir = ${source_local_dir_music}"
                echo "playlists_dir = ${source_local_dir_playlists}"
            else
                echo "[local]"
                echo "enabled = false"
                echo "[file]"
                echo "enabled = false"
                echo "[m3u]"
                echo "enabled = false"
            fi
        #SOURCE YOUTUBE
            if [ ${source_youtube} = true ]; then
                cv source_youtube_autoplay false
                cv source_youtube_channel ""
                echo "[youtube]"
                echo "allow_cache = true"
                echo "musicapi_enabled = true"
                echo "autoplay_enabled = ${source_youtube_autoplay}"
                echo "search_results = ${mopidy_results_online}"
                echo "max_autoplay_length = 7200"
                echo "playlist_max_videos = 100"
                echo "channel_id = ${source_youtube_channel}"
                echo "youtube_dl_package = yt_dlp"
            else
                echo "[youtube]"
                echo "enabled = false"
            fi
        #SOURCE SOUNDCLOUD
            if [ ${source_soundcloud} = true ]; then
                echo "[soundcloud]"
                echo "explore_songs = ${mopidy_results_online}"
                echo "auth_token = ${source_soundcloud_token}"
            else
                echo "[soundcloud]"
                echo "enabled = false"
            fi
        #SOURCE MIXCLOUD
            if [ ${source_mixcloud} = true ]; then
                cv source_mixcloud_users ""
                cv source_mixcloud_tags ""
                echo "[mixcloud]"
                echo "search_max = ${mopidy_results_online}"
                echo "users ="
                for i in ${source_mixcloud_users[@]}; do echo "    $i"; done
                echo "tags ="
                for i in ${source_mixcloud_tags[@]}; do echo "    $i"; done
            else
                echo "[mixcloud]"
                echo "enabled = false"
            fi
        #INTERFACE IRIS
            if [ ${interface_iris} = true ]; then
                echo "[iris]"
                #echo verify_certificates =
                echo "data_dir = /etc/mopidy/iris"
            else
                echo "[iris]"
                echo "enabled = false"
            fi
        #INTERFACE YAP
            if [ ${interface_yap} = true ]; then
                cv interface_yap_votes 1
                echo "[yap]"
                echo "votes_to_skip = ${interface_yap_votes}"
                echo "votes_to_delete = ${interface_yap_votes}"
                echo "votes_to_top = ${interface_yap_votes}"
                echo "pause_button = false"
            else
                echo "[yap]"
                echo "enabled = false"
            fi
        #INTERFACE MOBILE
            if [ ${interface_mobile} = true ]; then
                echo "[mobile]"
                echo "title = Home Assistant Addon: Mopidy+"
            else
                echo "[mobile]"
                echo "enabled = false"
            fi
        } > "/etc/mopidy/mopidy.conf"
    #START
        if [ ${source_local} = true ]; then
            bashio::log.info "SCANNING LOCAL MEDIA ..."
            mopidy -q --config "/etc/mopidy/mopidy.conf" local scan
        fi
        bashio::log.info "STARTING MOPIDY ..."
        mopidy -q --config "/etc/mopidy/mopidy.conf"
#################################################################################