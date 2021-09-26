#!/usr/bin/with-contenv bashio

#hassos config file
CONFIG_PATH=/data/options.json

bashio::log.info "Passing ${CONFIG_PATH} to ialarm-mqtt..."

#npx ialarm-mqtt --hassos ${CONFIG_PATH}
ialarm-mqtt --hassos ${CONFIG_PATH}


