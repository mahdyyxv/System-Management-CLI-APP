#!/bin/bash
total_size=$(df -h | grep root | awk '{print $2}')	
used_Percentage=$(df -h | grep root | awk '{print $5}')
free_size=$(df -h | grep root | awk '{print $4}')

echo "used = ${used_Percentage}"
echo "free = ${free_size}"	