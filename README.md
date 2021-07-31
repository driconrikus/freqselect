# freqselect
Simple bash interactive tool built around cpupower to select cpu frequency governor from command line

# Requirements

* Any Linux distribution.
* `linux-tools-generic` on debian/ubuntu based distros.
* `kernel-tools`on RHEL based distros.
# How to use
1. clone this repo with `git clone https://github.com/driconrikus/freqselect.git`
2. Install dependencies, if needed. 
 For Debian/Ubuntu based distros: `sudo apt install linux-tools-generic`
 For RHEL based distros `sudo dnf install kernel-tools` or `yum install kernel-tools`
3. make the script executable if needed. `chmod +x freqselect.sh`
4. Run it! `./freqselect`
5. Optionally, you can move it to `/usr/local/bin`if you want to have it available to all users.

# Notes
* This script must be run as root.
* The effects of this script will not persist on reboot. To be implemented.