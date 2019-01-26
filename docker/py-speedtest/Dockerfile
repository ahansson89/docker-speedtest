FROM python:3

WORKDIR /usr/src/app

ENV INFLUXDB_DB="speedtest" \
    INFLUXDB_URL="http://influxdb:8086" \
    SPEEDTEST_HOST="local" \
    SPEEDTEST_INTERVAL=3600

COPY . .

RUN pip install speedtest-cli; apt update; apt install jq


CMD [ "bash", "run.sh" ]
