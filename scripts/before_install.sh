#!/bin/bash
echo "Removing existing JAR file..."
rm -f /home/ubuntu/app/backend-0.0.1-SNAPSHOT.jar

echo "Logging in to Amazon ECR..."
aws ecr get-login-password --region ap-northeast-2 \
| docker login --username AWS --password-stdin 221082195716.dkr.ecr.ap-northeast-2.amazonaws.com

echo "Pulling latest Docker Image"
docker pull 221082195716.dkr.ecr.ap-northeast-2.amazonaws.com/weekly-repo:latest
