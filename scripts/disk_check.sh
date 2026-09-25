#!/bin/bash

THRESHOLD="${1:-80}"

if ! [[ "$THRESHOLD" =~ ^[0-9]+$ ]] || [ "$THRESHOLD" -gt 100 ]; then
    echo "Error: threshold must be a number between 0 and 100."
    exit 1
fi

echo "======================================"
echo "       Disk Usage Check"
echo "======================================"
echo "Warning threshold: ${THRESHOLD}%"
echo

printf "%-25s %-10s %-10s\n" "Filesystem" "Usage" "Status"
printf "%-25s %-10s %-10s\n" "----------" "-----" "------"

df -P | awk -v threshold="$THRESHOLD" '
NR > 1 {
    usage = $5
    mount = $6

    gsub("%", "", usage)

    usage_num = usage + 0

    if (usage_num >= threshold) {
        status = "WARNING"
    } else {
        status = "OK"
    }

    printf "%-25s %-10s %-10s\n", mount, usage_num "%", status
}
'

echo
echo "Disk check completed."
