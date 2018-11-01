#!/bin/sh
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker tag ngeor/swagger-to-diagram ngeor/swagger-to-diagram:$TRAVIS_TAG
docker push ngeor/swagger-to-diagram
docker logout
