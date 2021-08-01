# freqselect
Simple interactive tool built around cpupower to manipulate CPU frequency governor from command line to help you get the best performance or battery life for your computer.

![alt text](https://github.com/driconrikus/freqselect/blob/main/demo/demo.png?raw=true)

# Requirements

* Any Linux distribution.
* `linux-tools-generic` on debian/ubuntu based distros.
* `kernel-tools` on RHEL based distros.
# How to use
1. clone this repo with `git clone https://github.com/driconrikus/freqselect.git`
2. Install dependencies, if needed. 
 For Debian/Ubuntu based distros: `sudo apt install linux-tools-generic`
 For RHEL based distros `sudo dnf install kernel-tools` or `yum install kernel-tools`
3. make the script executable if needed. `chmod +x freqselect.sh`
4. Run it! `./freqselect`
5. Optionally, you can move it (or softlink it) to `/usr/local/bin`if you want to have it available to all users.

# Notes
* This script must be run as root.
* Persistence mode relies on systemd, it will not work on init based systems.