#!/bin/bash
echo "Stopping existing container if running..."
CONTAINER_ID=$(docker ps -q --filter "name=weekly-backend")

if [ ! -z "$CONTAINER_ID" ]; then
  docker stop $CONTAINER_ID
  docker rm $CONTAINER_ID
fi

echo "Removing old Docker image..."
docker rmi 221082195716.dkr.ecr.ap-northeast-2.amazonaws.com/weekly-repo:latest || true
