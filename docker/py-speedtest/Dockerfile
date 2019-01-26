FROM python:3
MAINTAINER Jonas Friedmann <j@frd.mn>

WORKDIR /usr/src/app

ENV INFLUXDB_DB="speedtest" \
    INFLUXDB_URL="http://influxdb:8086" \
    SPEEDTEST_HOST="local" \
    SPEEDTEST_INTERVAL=3600

COPY . .

RUN pip install speedtest-cli

CMD [ "python", "start" ]
