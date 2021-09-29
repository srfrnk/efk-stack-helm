#!/bin/sh

status_code=0

echo "Waiting for index to be created..."

while [[ "${status_code}" != "200" ]]; do
  status_code=$(curl -o /dev/null -s -w "%{http_code}\n" -X POST -H "Content-Type: application/json" -H "kbn-xsrf: anything" "http://efk-kibana:5601/api/saved_objects/index-pattern/logstash-*" \
    -d '{"attributes":{"title":"logstash-*","timeFieldName":"@timestamp"}}')
  echo "."
  sleep 10
done

echo "Created!"
