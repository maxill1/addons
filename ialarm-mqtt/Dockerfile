ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install requirements for add-on
RUN apk add --update --no-cache nodejs npm
#RUN npm install -g -s --no-progress npx ialarm-mqtt 
RUN npm install -g ialarm-mqtt 

# our add-on persistent data directory.
WORKDIR /data

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]