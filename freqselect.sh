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
while true; do
# Query current CPU governor
cpufreq=$(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | head -1)
echo -e "Your current CPU governor is: ${GREEN}${BOLD} ${cpufreq} ${NC}"
#Persistance status placeholder
echo -e "Persistance status: ${RED}${BOLD}Inactive${NC}" 
# CPU Governor interactive selector
echo -e "Please select a CPU governor:
	1. performance ${DIM}(Best performance. Full CPU frequency at all times, ${BOLD}reduces battery life significantly.)${NC}
	2. ondemand    ${DIM}(Balanced performarmance. CPU frequency scales depending on current system load, ${BOLD}average battery life.)${NC}
	3. powersave   ${DIM}(Slow performance. Low CPU frequency at all times, ${BOLD}increases battery life significantly.)${NC}
	4. schedutil   ${DIM}(Defaut setting. Similar to ondemand. ${BOLD}Average battery life.)${NC}
	5. Enable/Disable persistance.
	6. Exit
	"
# Grab user input
read option
	case $option in
		1)
		  echo -e "Setting governor to ${BLUE}${BOLD}performance${NC}..."
		  cpupower frequency-set --governor performance
		  echo "Done!"
		  exit 0
		 ;;
		2)
		  echo -e "Setting governor to ${BLUE}${BOLD}ondemand${NC}..."
		  cpupower frequency-set --governor ondemand
		  echo "Done!"
		  exit 0
		 ;;
		3)
		  echo -e "Setting governor to ${BLUE}${BOLD}powersave${NC}..."
		  cpupower frequency-set --governor powersave
		  echo "Done!"
		  exit 0
		 ;;
		4)
		  echo -e "Setting governor to ${BLUE}${BOLD}schedutil${NC}..."
		  cpupower frequency-set --governor schedutil
		  echo "Done!"
		  exit 0
		 ;;
		5)
		  echo -e "${GREEN}Persistance feature not available yet!${NC} \n"
		  sleep 3
		 ;;
		6)
		  echo "Bye!"
		  exit 0
		  ;;
		*)
			echo -e "${RED}Invalid option${NC}. Please choose a number from above! \n"
			sleep 3
	 	 ;;
	esac
	done		
fi