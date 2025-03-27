#!/bin/bash
docker stop weekly-backend 2>/dev/null || true
docker rm weekly-backend 2>/dev/null || true
