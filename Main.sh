#!/bin/bash
# Author: Ahmed Mahdy

flag=0

cpu_scaling_goveror_opt=(powersave ondemand performance)
cpu_policy_files=($(ls -l /sys/devices/system/cpu/cpufreq/policy0/ | grep rw | awk '{print $9}'))

function_array=(cpu_read mem_read hd_read Network_info Dir_sync led_control battery_threshold change_cpu_policy Kernel_Logs ctrl_sys_state)

function on_exit()
{
	echo "I'll Exit now be patient :)"

	rm kernel_logs.log > /dev/null 2>&1
	rm network_info.log > /dev/null 2>&1
	rm out.txt > /dev/null 2>&1

	sleep 1
	
	exit
}

trap on_exit SIGINT SIGTERM


if [[ $EUID -ne 0 ]]
then 
	././print_colored.sh "1;31" "Welcom ${USER}"
	././print_colored.sh 33 "____________________________________________"	
else
	flag=1
	././print_colored.sh "1;31" "Welcom Admin"
	././print_colored.sh 33 "____________________________________________"
fi

while [[ flag -eq 1 ]]; do
	./Admin_Cli.sh
	read -p "Input: " user_choice
	
	case $user_choice in
		1)
			eval "./${function_array[$((user_choice-1))]}.sh"
			;;
		2)
			eval "./${function_array[$((user_choice-1))]}.sh"
			;;
		3)
			eval "./${function_array[$((user_choice-1))]}.sh"
			;;
		4)
			eval "./${function_array[$((user_choice-1))]}.sh"
			;;
		5)
			read -p "Enter Source Dir.: " SRC_DIR
			read -p "Enter Target Dir.: " TGT_DIR
			read -p "Enter Target IP. : " TGT_IP
			read -p "Enter User name. : " USR_NAME
			./Dir_sync.sh $SRC_DIR $TGT_DIR $TGT_IP $USR_NAME
			;;
		6)
			read -p "please choose from this(caps/num): " led_choice_1
			read -p "please choose from this(on/off): " led_choice_2
			./led_control.sh $led_choice_1 $led_choice_2
			;;
		7)
			read -p "please enter start threshold: " start_threshold
			read -p "please enter stop threshold: " stop_threshold
			if [[ $start_threshold -ne $stop_threshold 
				&& $start_threshold -lt $stop_threshold 
				&& $start_threshold -lt 100
				&& $stop_threshold -lt 100
				&& $start_threshold -ge 0
				&& $stop_threshold -ge 0 ]]; then
				./battery_threshold.sh $start_threshold $stop_threshold
			else 
				./print_colored.sh "1;31" "PARAMETER ERR"
			fi
			;;
		8)
			cnt=0
			for i in "${cpu_policy_files[@]}"; do
				./print_colored.sh 33 "${cnt}: $i"
				((cnt++))
			done 
			read -p "please choose from this: " cpu_choice
			cnt=0
			case $cpu_choice in
				0)
					for i in "${cpu_scaling_goveror_opt[@]}"; do
						./print_colored.sh 33 "${cnt}: $i"
						((cnt++))
					done 
					read -p "please choose from this: " choice
					./change_cpu_policy.sh 0 ${cpu_scaling_goveror_opt[$choice]}
					;;
				1)
					read -p "Enter Changes: " changes
					./change_cpu_policy.sh $cpu_choice  $changes
					;;
				2)
					read -p "Enter Changes: " changes
					./change_cpu_policy.sh $cpu_choice  $changes
					;;
				3)
					read -p "Enter Changes: " changes
					./change_cpu_policy.sh $cpu_choice  $changes
					;;
				*)
					./print_colored.sh "1;31" "PARAMETER ERR"
					;;
			esac
			;;	
		9)	
			eval "./${function_array[$((user_choice-1))]}.sh"
			;;
		10)
			read -p "choose (poweroff halt reboot)" choice
			./ctrl_sys_state.sh $choice	
			;;		
		*)
			echo "incrorrect input"
			;;
	esac
	
	./print_colored.sh "1;2;4;31" "Press Enter to continue"
	read 
	clear
	
done

while [[ flag -eq 0 ]]; do
	./User_Cli.sh
	read -p "Input: " user_choice
	
	case $user_choice in
		1)
			eval "./${function_array[$((user_choice-1))]}.sh"
			;;
		2)
			eval "./${function_array[$((user_choice-1))]}.sh"
			;;
		3)
			eval "./${function_array[$((user_choice-1))]}.sh"
			;;
		4)
			eval "./${function_array[$((user_choice-1))]}.sh"
			;;
		5)
			read -p "Enter Source Dir.: " SRC_DIR
			read -p "Enter Target Dir.: " TGT_DIR
			read -p "Enter Target IP. : " TGT_IP
			read -p "Enter User name. : " USR_NAME
			./Dir_sync.sh $SRC_DIR $TGT_DIR $TGT_IP $USR_NAME
			;;
		*)
			echo "incrorrect input"
			;;
	esac
	./print_colored.sh "1;2;4;31" "Press Enter to continue"
	read 
	clear
	
done
