#!/bin/bash

ECR_URI=221082195716.dkr.ecr.ap-northeast-2.amazonaws.com/weekly-repo

echo "Stopping existing container (if running)..."
CONTAINER_ID=$(docker ps -q --filter "name=weekly-backend")
if [ ! -z "$CONTAINER_ID" ]; then
  docker stop $CONTAINER_ID
  docker rm $CONTAINER_ID
fi

echo "Removing old Docker image (if exists)..."
docker rmi $ECR_URI:latest || true

echo "Logging in to Amazon ECR..."
aws ecr get-login-password --region ap-northeast-2 \
| docker login --username AWS --password-stdin $ECR_URI

echo "Pulling latest Docker image from ECR..."
docker pull $ECR_URI:latest
