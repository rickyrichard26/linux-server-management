#!/bin/bash

echo "======================================"
echo "       Service Status Check"
echo "======================================"

if [ "$#" -eq 0 ]; then
    echo "No service specified."
    echo
    echo "Usage: ./scripts/service_status.sh <service-name>"
    exit 1
fi

for servic in "$@"; do
    echo
    echo "Service: $service"

    if systemctl is-active --quiet "$service"; then
        echo "Status: ACTIVE"
    elif systemctl is-enabled --quiet "$service" 2>/dev/null; then
        echo "Status: INACTIVE"
    else
        echo "Status: NOT FOUND OR NOT ENABLED"
    fi
done

echo
echo "Service check completed."
