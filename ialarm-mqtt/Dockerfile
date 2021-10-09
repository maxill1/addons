ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install requirements for add-on
RUN apk add --update --no-cache nodejs npm

# get latest package and extract in app folder
WORKDIR /app
RUN npm install --prefix /app ialarm-mqtt@latest
RUN cd /app && npm install

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]