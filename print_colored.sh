#!/bin/bash
color=$1
text=$2
echo -e "\033[${color}m${text}\033[0m"
