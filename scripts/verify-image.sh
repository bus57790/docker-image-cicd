#!/bin/bash

REGISTRY=$1
IMAGE=$2
TAG=$3

echo "Pulling image..."
docker pull $REGISTRY/$IMAGE:$TAG

echo "Running container..."
docker run -d -p 8085:80 --name test-container $REGISTRY/$IMAGE:$TAG

sleep 5
curl http://localhost:8085

docker rm -f test-container

