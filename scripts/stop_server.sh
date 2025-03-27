#!/bin/bash

echo "Stopping old container (if exists)..."
docker stop weekly-backend 2>/dev/null || true
docker rm weekly-backend 2>/dev/null || true
