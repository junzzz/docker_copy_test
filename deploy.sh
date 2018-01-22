#!/bin/sh
docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
docker build -t docker_copy_test/app:$CIRCLE_SHA1 .
docker push docker_copy_test/app:$CIRCLE_SHA1