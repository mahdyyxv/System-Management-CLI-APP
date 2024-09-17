#!/bin/bash

touch "kernel_logs.log"
./print_colored.sh 33 "please see kernel_logs.log"
echo "Kernel Logs: " > "kernel_logs.log"
dmesg >> "kernel_logs.log"