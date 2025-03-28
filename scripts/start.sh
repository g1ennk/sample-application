#!/bin/bash

echo "[ApplicationStart] Cleaning up existing container (if any)..."
docker stop weekly-backend 2>/dev/null || true
docker rm weekly-backend 2>/dev/null || true

# ECR 로그인
aws ecr get-login-password --region ap-northeast-2 | \
docker login --username AWS --password-stdin 221082195716.dkr.ecr.ap-northeast-2.amazonaws.com

IMAGE_TAG=$(cat /home/ubuntu/image_tag.txt)
REPO=221082195716.dkr.ecr.ap-northeast-2.amazonaws.com/weekly-repo

docker pull $REPO:$IMAGE_TAG
docker run -d \
  --name weekly-backend \
  -p 8080:8080 \
  -e SERVER_PORT=8080 \
  -e DB_HOST=rds.g1enn.site \
  -e DB_PORT=3306 \
  -e DB_USER=admin \
  -e DB_PASSWORD=alstjr11 \
  -e DB_NAME=weekly_db \
  $REPO:$IMAGE_TAG
