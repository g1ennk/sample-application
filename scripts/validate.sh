#!/bin/bash
echo "Validating deployment..."
curl -f http://localhost:8080/users || exit 1
