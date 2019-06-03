#!/bin/bash

for i in {5..1}; do
    if curl elasticsearch:9200; then
        curl -H 'Content-Type: application/json' -X PUT elasticsearch:9200/content -d @/data.json;
        break;
    fi
    sleep 2
done
