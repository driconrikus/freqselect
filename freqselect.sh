#!/bin/bash
# Change cpu governor to performance
# This must be run as root
# Ricardo Valdez @driconrikus

# Check if user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
else

# Query current CPU governor
cpufreq=$(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | head -1)
echo "Your current CPU governor is: \n $cpufreq"

# CPU Governor interactive selector
echo "Please select cpu governor:
	1. Performance (full CPU frequency, kills battery)
	2. Ondemand    (CPU frequency scales as programs need it, saves battery)
	3. Powersave   (Low CPU frequency, saves even more battery)
	"
# Grab user input
read option
	case $option in
		1)
		  echo "Setting performance governor..."
		  cpupower frequency-set --governor performance
		  echo "Done!"
		 ;;
		2)
		  echo "Setting performance to Ondemand..."
		  cpupower frequency-set --governor ondemand
		  echo "Done!"
		 ;;
		3)
		  echo "Setting performance to Powersave..."
		  cpupower frequency-set --governor powersave
		  echo "Done!"
		 ;;
		 *)
			echo "Invalid option. Please choose 1, 2 or 3"
	 	 ;;
	esac
			
fi
