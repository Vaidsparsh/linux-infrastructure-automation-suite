#!/bin/bash
LOG_FILE="./logs/system_monitor.log"

# Ensure log directory exists
mkdir -p ./logs

# Capture current system stats
CPU_LOAD="$(uptime)"
MEMORY_USAGE="$(free -m | grep Mem)"
DISK_USAGE="$(df -h / | grep /$)"

# Print to terminal
echo "==== System Health @ $(date) ===="
echo "CPU Load: $CPU_LOAD"
echo "Memory Usage: $MEMORY_USAGE"
echo "Disk Usage: $DISK_USAGE"
echo "------------------------------"

# Also write to log file
{
  echo "==== System Health @ $(date) ===="
  echo "CPU Load: $CPU_LOAD"
  echo "Memory Usage: $MEMORY_USAGE"
  echo "Disk Usage: $DISK_USAGE"
  echo "------------------------------"
} >> "$LOG_FILE"

