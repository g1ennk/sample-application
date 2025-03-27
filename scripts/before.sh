#!/bin/bash

docker system prune -af --volumes 2>/dev/null || true
