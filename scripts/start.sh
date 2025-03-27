#!/bin/bash

IMAGE_TAG=$(cat /home/ubuntu/image_tag.txt)
REPO=221082195716.dkr.ecr.ap-northeast-2.amazonaws.com/weekly-repo

docker pull $REPO:$IMAGE_TAG
docker run -d \
  --name weekly-backend \
  -p 8080:8080 \
  -e SERVER_PORT=8080 \
  $REPO:$IMAGE_TAG
