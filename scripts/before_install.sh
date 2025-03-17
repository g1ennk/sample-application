#!/bin/bash
echo "Stopping existing container if running..."
CONTAINER_ID=$(docker ps -q --filter "name=weekly-backend")

if [ ! -z "$CONTAINER_ID" ]; then
  docker stop CONTAINER_ID
  docker rm CONTAINER_ID
fi

echo "Removing old Docker image..."
docker rmi g1enn/weekly-backend-app:latest || true
