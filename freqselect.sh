#!/bin/bash
# Change cpu governor to performance
# This must be run as root
# Ricardo Valdez @driconrikus

# Pretty colors
RED='\e[31m'
GREEN='\e[32m'
BLUE='\e[34m'
DIM='\e[2m'
NC='\e[0m'
BOLD='\e[1m'

# Check if user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as ${RED}root!${NC}"
   exit 1
else

# Query current CPU governor
cpufreq=$(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | head -1)
echo -e "Your current CPU governor is: ${GREEN}${BOLD} ${cpufreq} ${NC}"

# CPU Governor interactive selector
echo -e "Please select a CPU governor:
	1. performance ${DIM}(Best performance. Full CPU frequency at all times, increases CPU temperatures, ${BOLD}reduces battery life significantly.)${NC}
	2. ondemand    ${DIM}(Balanced performarmance. CPU frequency scales depending on current system load, ${BOLD}average battery life.)${NC}
	3. powersave   ${DIM}(Slow performance. Low CPU frequency at all times, ${BOLD}increases battery life significantly.)${NC}
	4. schedutil   ${DIM}(Defaut setting. Similar to ondemand. ${BOLD}Average battery life.)${NC}
	"
# Grab user input
read option
	case $option in
		1)
		  echo -e "Setting governor to ${BLUE}${BOLD}performance${NC}..."
		  cpupower frequency-set --governor performance
		  echo "Done!"
		 ;;
		2)
		  echo -e "Setting governor to ${BLUE}${BOLD}ondemand${NC}..."
		  cpupower frequency-set --governor ondemand
		  echo "Done!"
		 ;;
		3)
		  echo -e "Setting governor to ${BLUE}${BOLD}powersave${NC}..."
		  cpupower frequency-set --governor powersave
		  echo "Done!"
		 ;;
		4)
		  echo -e "Setting governor to ${BLUE}${BOLD}schedutil${NC}..."
		  cpupower frequency-set --governor schedutil
		  echo "Done!"
		 ;;
		 *)
			echo "Invalid option. Please choose a number from above!"
			exit 1
	 	 ;;
	esac		
fi
