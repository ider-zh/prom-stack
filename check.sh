#!/bin/bash

function indent() {
  sed 's/^/    /' $@
}

echo "Prometheus:"
curl -sX GET http://localhost:9090/-/healthy | indent
curl -sX GET http://localhost:9090/-/ready | indent

echo "Grafana:"
curl -sX GET http://localhost:3000/api/health | indent
echo

echo

echo "Listening ports:"
netstat -lt | grep -E "9090|9091|9093|3000" | indent

echo "Instantiated pods:"
docker ps | grep prom-stack | indent
