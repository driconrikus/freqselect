# freqselect
Simple interactive tool built around cpupower to manipulate CPU frequency governor from command line to help you get the best performance or battery life for your computer.

Current options are:
* performance (Best performance. Full CPU frequency at all times, **reduces battery life significantly.**)
* ondemand    (Balanced performarmance. CPU frequency scales depending on current system load, **average battery life.**)
* powersave   (Slow performance. Low CPU frequency at all times, **increases battery life significantly.**)
* schedutil   (Defaut setting. Similar to ondemand. **Average battery life.**)

You can also choose to keep settings at boot time with the persistance option.

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