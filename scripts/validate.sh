#!/bin/bash

echo "Validating deployment..."
curl http://localhost:8080/users || exit 1
