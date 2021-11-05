ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install requirements for add-on
RUN apk add --update --no-cache nodejs npm

# get latest package and extract in app folder
WORKDIR /tmp
RUN npm v ialarm-mqtt@0.10.0 dist.tarball | xargs curl | tar -xz
RUN mkdir -p /app && mv /tmp/package /app/ialarm-mqtt
WORKDIR /app/ialarm-mqtt
RUN npm install

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]