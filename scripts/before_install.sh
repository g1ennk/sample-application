#!/bin/bash

echo "Stopping and removing old container..."
docker stop weekly-backend 2>/dev/null || true
docker rm weekly-backend 2>/dev/null || true
