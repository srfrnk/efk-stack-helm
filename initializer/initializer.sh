#!/bin/sh

status_code=0

echo "Waiting for index to be created..."

while [[ "${status_code}" != "200" ]]; do
  status_code=$(curl -o /dev/null -s -w "%{http_code}\n" -X POST "http://efk-kibana:5601/api/index_patterns/index_pattern" -H 'kbn-xsrf: true' -H 'Content-Type: application/json' -d'
  {
    "override": true,
    "refresh_fields": true,
    "index_pattern": {
      "title": "logstash-*",
      "timeFieldName":"@timestamp"
    }
  }')
  echo "."
  sleep 10
done

echo "Created!"
