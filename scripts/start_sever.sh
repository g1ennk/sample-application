#!/bin/bash

echo "Pulling latest image..."
docker pull 221082195716.dkr.ecr.ap-northeast-2.amazonaws.com/weekly-repo:latest

echo "Running container..."
docker run -d \
  --name weekly-backend \
  -p 8080:8080 \
  221082195716.dkr.ecr.ap-northeast-2.amazonaws.com/weekly-repo:latest
