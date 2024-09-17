#!/bin/bash

echo "please wait this may take a while :)"
touch "network_info.log" > /dev/null 2>&1
touch "out.txt"
ip_addr=$(nmcli dev show | grep 'IP4.ADDRESS' | awk '{print $2}')
ip_dns=$(nmcli dev show | grep 'IP4.DNS' | awk '{print $2}')
speedtest --simple > "out.txt"
speed=($(grep 'Download\|Upload' "out.txt" | awk '{print $2}'))
rm "out.txt"
echo "Plaese see log file at network_info.log"
echo "IP Address: $ip_addr" > network_info.log
echo "DNS Server: $ip_dns" >> network_info.log
echo "Download Speed: ${speed[0]} Mbit/s" >> network_info.log
echo "Upload Speed: ${speed[1]} Mbit/s" >> network_info.log