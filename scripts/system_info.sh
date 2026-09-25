#!/bin/bash

echo "======================================"
echo "      Linux System Information"
echo "======================================"

echo "Hostname: $(hostname)"
echo "Operating System: $(uname -s)"
echo "Kernel Version: $(uname -r)"
echo "Architecture: $(uname -m)"
echo "Uptime: $(uptime -p)"
echo "Current User: $(whoami)"
echo "Date: $(date)"

echo "======================================"
