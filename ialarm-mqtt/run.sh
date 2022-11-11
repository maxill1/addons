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
    
NODE_VERSION=$(node -v)

bashio::log.info "Starting ialarm-mqtt@${APP_VERSION} ${CONFIG_PATH} to with node-ialarm@${LIB_VERSION} on node ${NODE_VERSION}"

cd ${APP_PATH}
exec node --entry-type=module bin/ialarm-mqtt.js --hassos ${CONFIG_PATH}