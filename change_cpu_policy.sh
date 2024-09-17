#!/bin/bash
cpu_policy_dir="/sys/devices/system/cpu/cpufreq/policy*/"
cpu_policy_files=($(ls -l /sys/devices/system/cpu/cpufreq/policy0/ | grep rw | awk '{print $9}'))

for file in "${cpu_policy_dir}${cpu_policy_files[$1]}"; do
    echo $2 | tee $file > /dev/null
done