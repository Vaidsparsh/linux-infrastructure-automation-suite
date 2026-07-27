#!/bin/bash
echo "---- System Tuning ----"
sudo tuned-adm profile balanced
echo "Current profile: $(tuned-adm active)"

read -p "Switch to (balanced / throughput-performance / powersave): " prof
sudo tuned-adm profile $prof
echo "Profile changed to: $(tuned-adm active)"

