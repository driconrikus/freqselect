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
   echo -e "This script must be run as ${RED}root!${NC}"
   exit 1
else
while true; do
# Query current CPU governor
cpufreq=$(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | head -1)
echo -e "Your current CPU frequency governor is: ${GREEN}${BOLD} ${cpufreq} ${NC}"
#Persistence status placeholder
persistence=$(systemctl status cpupower.service | grep "Succeeded" | awk '{print $7}')
if [[ $persistence == "Succeeded." ]]; then
echo -e "Persistence status: ${GREEN}${BOLD}Active${NC}" 
else
echo -e "Persistence status: ${RED}${BOLD}Inactive${NC}"
fi
# CPU Governor interactive selector
echo -e "Please select a CPU governor:
1. ${BOLD}performance${NC} ${DIM}(Best performance. Full CPU frequency at all times, ${BOLD}reduces battery life significantly.)${NC}
2. ${BOLD}ondemand${NC}    ${DIM}(Balanced performarmance. CPU frequency scales depending on current system load, ${BOLD}average battery life.)${NC}
3. ${BOLD}powersave${NC}   ${DIM}(Slow performance. Low CPU frequency at all times, ${BOLD}increases battery life significantly.)${NC}
4. ${BOLD}schedutil${NC}   ${DIM}(Defaut setting. Similar to ondemand. ${BOLD}Average battery life.)${NC}
5. ${BOLD}Enable persistence${NC} ${DIM}(Keeps settings across reboots.)${NC}
6. ${BOLD}Disable persistence${NC}
7. ${BOLD}Exit${NC}
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
# writes a systemd unit with cpupower and the chosen cpu governor then enables it at boot time.
		5)
		  pers_file=/etc/systemd/system/cpupower.service
		  if [ -f "$pers_file" ]; then
    			echo -e "${GREEN}Service is already enabled!${NC} \n"
				sleep 3
		  else 
		  echo -e "Enabling persistence..."
		  echo "[Unit]
Description=cpufreq governor persistence
[Service]
Type=simple
ExecStart=/usr/bin/cpupower -c all frequency-set --governor ${cpufreq}
[Install]
WantedBy=multi-user.target" >> /etc/systemd/system/cpupower.service
		  systemctl daemon-reload
		  systemctl enable cpupower.service --now
		  echo -e "${GREEN}Persistence has been enabled.${NC}\n"
		  sleep 3
		  fi
		 ;;
# deletes the created systemd unit.
		6)
			echo -e "Disabling persistence..."
			systemctl disable cpupower.service --now
			rm /etc/systemd/system/cpupower.service
			systemctl daemon-reload
			echo -e "${RED}Persistence has been disabled.${NC}\n"
			sleep 3
		 ;;
		7)
		  echo "Bye!"
		  exit 0
		  ;;
		*)
		  echo -e "${RED}Invalid option${NC}. Please choose an option from above! \n"
		  sleep 3
	 	 ;;
	esac
	done		
fi