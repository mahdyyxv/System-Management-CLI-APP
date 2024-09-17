#!/bin/bash
function get_cpu_usage() {
    cpu_stats_before=$(head -n 1 /proc/stat)

    sleep 1

    cpu_stats_after=$(head -n 1 /proc/stat)

    cpu_fields_before=($cpu_stats_before)
    cpu_fields_after=($cpu_stats_after)

    user_before=${cpu_fields_before[1]}
    nice_before=${cpu_fields_before[2]}
    system_before=${cpu_fields_before[3]}
    idle_before=${cpu_fields_before[4]}
    iowait_before=${cpu_fields_before[5]}
    irq_before=${cpu_fields_before[6]}
    softirq_before=${cpu_fields_before[7]}
    steal_before=${cpu_fields_before[8]}

    user_after=${cpu_fields_after[1]}
    nice_after=${cpu_fields_after[2]}
    system_after=${cpu_fields_after[3]}
    idle_after=${cpu_fields_after[4]}
    iowait_after=${cpu_fields_after[5]}
    irq_after=${cpu_fields_after[6]}
    softirq_after=${cpu_fields_after[7]}
    steal_after=${cpu_fields_after[8]}

    total_before=$((user_before + nice_before + system_before + idle_before + iowait_before + irq_before + softirq_before + steal_before))
    total_after=$((user_after + nice_after + system_after + idle_after + iowait_after + irq_after + softirq_after + steal_after))

    idle_diff=$((idle_after - idle_before))
    total_diff=$((total_after - total_before))

    cpu_usage=$((100 * (total_diff - idle_diff) / total_diff))

    ./print_colored.sh "1;4;32" "CPU Usage: $cpu_usage%"
}


./print_colored.sh 33 "____________________________________________"
cnt=0
tmp=0
all=($(grep "cpu MHz" /proc/cpuinfo | awk '{print $4}'))
for i in "${all[@]}";do
    tmp=$(echo "scale=4; $i / 1000" | bc)
    ./print_colored.sh 32 "cpu ${cnt} freq = $tmp GHz";
    ((cnt++))
done
./print_colored.sh 33 "____________________________________________"
echo 
get_cpu_usage 
./print_colored.sh 33 "____________________________________________"
sensors | while read -r x; do
        if [[ $x = "Core "* ]];then
            ./print_colored.sh 34 "$x"
        fi
done 
./print_colored.sh 33 "____________________________________________"
