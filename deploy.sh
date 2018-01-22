#!/bin/sh
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
docker build -t junzzz/docker_copy_test/app:$CIRCLE_SHA1 .
docker push junzzz/docker_copy_test/app:$CIRCLE_SHA1