#!/bin/bash
echo "Starting new container..."
IMAGE_TAG=$(cat /home/ubuntu/app/image_tag.txt)
docker run -d -p 8080:8080 --name weekly-backend \
  --restart always \
  221082195716.dkr.ecr.ap-northeast-2.amazonaws.com/weekly-repo:latest
