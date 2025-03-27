#!/bin/bash

echo "Validating deployment..."
sleep 10  # 서버가 준비될 시간을 기다립니다.
curl -f http://localhost:8080/users || exit 1
