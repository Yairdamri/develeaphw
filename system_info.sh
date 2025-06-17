#!/bin/bash

# Default: verbose disabled
verbose=0

# Parse options
while getopts "v" opt; do
    case $opt in 
        v)
            echo "Verbose mode enabled"
            verbose=1
            ;;
        *)
            echo "Usage: $0 [-v]"
            exit 1
            ;;
    esac
done

# Always run basic info
echo "System Information Report"
uname -a
echo "---------------------------------------------"

# If verbose enabled → print extra details
if [ "$verbose" -eq 1 ]; then


echo "{"
echo "  \"hostname\": \"$(hostname)\","
echo "  \"operating_system\": \"$(uname -s)\","
echo "  \"kernel_version\": \"$(uname -r)\","
echo "  \"cpu_info\": \"$(cat /proc/cpuinfo | grep 'model name' | head -n1 | cut -d':' -f2 | xargs)\","
echo "  \"memory_total\": \"$(free -h | grep Mem | awk '{print $2}')\","
echo "  \"disk_space\": \"$(df -h / | tail -n1 | awk '{print $2}')\""
echo "}"



    # echo "Verbose mode: collecting additional system information..."
    # echo "Disk Usage"
    # du -h --max-depth=1
    # echo "---------------------------------------------"
    # echo "Memory Usage"
    # free -h
    # echo "---------------------------------------------"
    # echo "Number of Packages Installed"
    # dpkg -l | grep '^ii' | wc -l                     
    # echo "---------------------------------------------"
    # echo "CPU Information"
    # lscpu
    # echo "---------------------------------------------"
    # echo "Disk Report saved to disk-report-$(date +%Y-%m-%d-%H-%M-%S).log"
fi

# Save report to a file