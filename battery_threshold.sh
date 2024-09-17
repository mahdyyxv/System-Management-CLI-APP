#!/bin/bash
echo $1 > /sys/class/power_supply/BAT0/charge_control_start_threshold

echo $2 > /sys/class/power_supply/BAT0/charge_control_end_threshold
