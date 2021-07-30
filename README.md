# freqselect
Simple bash interactive tool built around cpupower to select cpu frequency governor from command line

# Requirements

* Any Linux distribution, Ubuntu recommended
* `cpupower` and `linux-tools-generic` on debian/ubuntu based distros

# How to use
1. clone this repo with `git clone https://github.com/driconrikus/freqselect.git`
2. Install dependencies, if required. For Debian/Ubuntu based distros: `sudo apt install cpupower linux-tools-generic`
3. make the script executable if needed. `chmod +x freqselect.sh`
4. Run it! `./freqselect`
5. Optionally, you can move it to `/usr/local/bin`if you want to have it available to all users.

# Notes
* The effects of this script will not persist on reboot.
* This script has not yet been tested on RHEL based distros, will test soon.