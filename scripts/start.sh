#!/bin/bash
echo "Starting new container..."
docker run -d -p 8080:8080 --name weekly-backend \
  --restart always \
  221082195716.dkr.ecr.ap-northeast-2.amazonaws.com/weekly-backend-app:latest
