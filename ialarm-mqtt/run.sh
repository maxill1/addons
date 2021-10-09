#!/usr/bin/with-contenv bashio

#hassos config file
CONFIG_PATH=/data/options.json
APP_PATH=/app/node_modules/ialarm-mqtt

ls $APP_PATH

#ialarm-mqtt version
PACKAGE_VERSION=$(cat ${APP_PATH}/package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g')

bashio::log.info "Passing ${CONFIG_PATH} to ialarm-mqtt@${PACKAGE_VERSION}"

node ${APP_PATH}/bin/ialarm-mqtt.js --hassos ${CONFIG_PATH}

