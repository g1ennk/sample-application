#!/bin/bash

echo "Stopping any running Docker container..."
docker stop weekly-backend 2>/dev/null || true
docker rm weekly-backend 2>/dev/null || true

echo "Killing leftover JAR processes (if any)..."
pkill -f backend-0.0.1-SNAPSHOT.jar || true

echo "Removing existing JAR file..."
rm -f /home/ubuntu/app/backend-0.0.1-SNAPSHOT.jar

echo "Logging in to Amazon ECR..."
aws ecr get-login-password --region ap-northeast-2 \
| docker login --username AWS --password-stdin 221082195716.dkr.ecr.ap-northeast-2.amazonaws.com

echo "Pulling latest Docker image..."
docker pull 221082195716.dkr.ecr.ap-northeast-2.amazonaws.com/weekly-repo:latest
