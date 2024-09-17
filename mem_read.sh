#!/bin/bash
availableMem=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
availableMem=$(echo "scale=4; $availableMem / 1048576" | bc)  # Convert to MB

totalMem=$(grep MemTotal /proc/meminfo | awk '{print $2}')
totalMem=$(echo "scale=4; $totalMem / 1048576" | bc)  # Convert to MB

diff=$(echo "scale=4; $totalMem - $availableMem" | bc)
memPercent=$(echo "scale=4; ($diff / $totalMem) * 100" | bc)

echo "Available Memory: ${availableMem} GB"
echo "Total Memory: ${totalMem} GB"
echo "Used Memory Percentage: ${memPercent}%"