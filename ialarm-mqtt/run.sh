#!/usr/bin/with-contenv bashio

#hassos config file
CONFIG_PATH=/data/options.json
APP_PATH=/app/ialarm-mqtt
LIB_PATH=/app/ialarm-mqtt/node_modules/ialarm

#ialarm-mqtt version
APP_VERSION=$(cat ${APP_PATH}/package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g')

LIB_VERSION=$(cat ${LIB_PATH}/package.json \
    | grep version \
    | head -1 \
    | awk -F: '{ print $2 }' \
    | sed 's/[",]//g')

bashio::log.info "Passing ${CONFIG_PATH} to ialarm-mqtt@${APP_VERSION} with node-ialarm@${LIB_VERSION}"

node ${APP_PATH}/bin/ialarm-mqtt.js --hassos ${CONFIG_PATH}

