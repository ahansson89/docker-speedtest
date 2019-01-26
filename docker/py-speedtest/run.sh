#!/bin/bash

while :; do
	echo "[Info][$(date)] Starting speedtest..."
	JSON=$(speedtest-cli --json)
	DOWNLOAD=$(echo "${JSON}" | jq '.download')
	UPLOAD=$(echo "$JSON" | jq '.upload')
	PING=$(echo "${JSON}" | jq '.ping')
	DOWNLOAD=$(echo $DOWNLOAD / 1024 / 1024 | bc)
	UPLOAD=$(echo $UPLOAD / 1024 / 1024 | bc)
	echo "[Info][$(date)] Speedtest results - Download: ${DOWNLOAD}, Upload: ${UPLOAD}, Ping: ${PING}"
	curl -sL -XPOST "${INFLUXDB_URL}/write?db=${INFLUXDB_DB}" --data-binary "download,host=${SPEEDTEST_HOST} value=${DOWNLOAD}"
	curl -sL -XPOST "${INFLUXDB_URL}/write?db=${INFLUXDB_DB}" --data-binary "upload,host=${SPEEDTEST_HOST} value=${UPLOAD}"
	curl -sL -XPOST "${INFLUXDB_URL}/write?db=${INFLUXDB_DB}" --data-binary "ping,host=${SPEEDTEST_HOST} value=${PING}"
	echo "[Info][$(date)] Sleeping for ${SPEEDTEST_INTERVAL} seconds..."
	sleep ${SPEEDTEST_INTERVAL}
done
