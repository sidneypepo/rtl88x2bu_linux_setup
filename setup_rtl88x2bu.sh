#!/usr/bin/env bash

#Credits:
#  _                              _    __
# | |                            | |  /  |
# | | _  _   _     ___ _   _  ___| | /_/ |____
# | || \| | | |   /___) | | |/___) || \| |  _ \
# | |_) ) |_| |  |___ | |_| |___ | |_) ) | | | |
# |____/ \__  |  (___/ \__  (___/|____/|_|_| |_|
#       (____/        (____/

if [ "$EUID" != 0 ]; then
	echo -e "\n\e[1;31m[!] This script must be run as root!\e[0m\n"
	exit

else
	clear

	echo -e "\n\e[1;37m==========> CHECKING DEPENDENCIES <==========\e[0m\n"

	#Checking if git is installed:
	echo -e "\e[1;33m[*] Checking if git is installed...\e[0m"
	sleep 1
	if [ -x "$(command -v git)" ]; then
		echo -e "\e[1;32m[+] Git is installed.\e[0m\n"

	else
		echo -e "\e[1;31m[!] Git isn't installed. Installing it...\e[0m"
		apt update -y -qq
		apt install git -y -qq
		sleep 1

		if [ -x "$(command -v git)" ]; then
			echo -e "\e[1;32m[+] Git installed.\e[0m\n"

		else
			echo -e "\e[1;31m[!] Git can't be installed. Verify if you're connected to Internet and try again later.\n\nExiting...\e[0m"
			sleep 3
			exit

		fi

	fi

	sleep 1
	echo -e "\e[1;34m[i] Press [ENTER] to continue.\e[0m"
	read enter > /dev/null

	#Checking if make is installed:
	echo -e "\e[1;33m[*] Checking if make is installed...\e[0m"
	sleep 1
	if [ -x "$(command -v make)" ]; then
		echo -e "\e[1;32m[+] Make is installed.\e[0m\n"

	else
		echo -e "\e[1;31m[!] Make isn't installed. Installing it...\e[0m"
		apt update -y -qq
		apt install $(apt search $(uname -r) | grep -i "linux-headers" | cut -d "/" -f 1) -y -qq
		apt install build-essential -y -qq
		sleep 1

		if [ -x "$(command -v make)" ]; then
			echo -e "\e[1;32m[+] Make installed.\e[0m\n"

		else
			echo -e "\e[1;31m[!] Make can't be installed. Verify if you're connected to Internet and try again later.\n\nExiting...\e[0m"
			sleep 3
			exit

		fi

	fi

	sleep 1
	echo -e "\e[1;34m[i] Press [ENTER] to continue.\e[0m"
	read enter > /dev/null

	#Checking if lsusb is installed:
	echo -e "\e[1;33m[*] Checking if lsusb is installed...\e[0m"
	sleep 1
	if [ -x "$(command -v lsusb)" ]; then
		echo -e "\e[1;32m[+] Lsusb is installed.\e[0m\n"

	else
		echo -e "\e[1;31m[!] Lsusb isn't installed. Installing it...\e[0m"
		apt update -y -qq
		apt install usbutils -y -qq
		sleep 1

		if [ -x "$(command -v lsusb)" ]; then
			echo -e "\e[1;32m[+] Lsusb installed.\e[0m\n"

		else
			echo -e "\e[1;31m[!] Lsusb can't be installed. Verify if you're connected to Internet and try again later.\n\nExiting...\e[0m"
			sleep 3
			exit

		fi

	fi

	sleep 1
	echo -e "\e[1;34m[i] Press [ENTER] to continue.\e[0m"
	read enter > /dev/null

	#Checking if bc is installed:
	echo -e "\e[1;33m[*] Checking if bc is installed...\e[0m"
	sleep 1
	if [ -x "$(command -v bc)" ]; then
		echo -e "\e[1;32m[+] Bc is installed.\e[0m\n"

	else
		echo -e "\e[1;31m[!] Bc isn't installed. Installing it...\e[0m"
		apt update -y -qq
		apt install bc -y -qq
		sleep 1

		if [ -x "$(command -v bc)" ]; then
			echo -e "\e[1;32m[+] Bc installed.\e[0m\n"

		else
			echo -e "\e[1;31m[!] Bc can't be installed. Verify if you're connected to Internet and try again later.\n\nExiting...\e[0m"
			sleep 3
			exit

		fi

	fi

	sleep 1
	echo -e "\e[1;34m[i] Press [ENTER] to continue.\e[0m"
	read enter > /dev/null

	#Checking if network-manager is installed:
	echo -e "\e[1;33m[*] Checking if network-manager is installed...\e[0m"
	sleep 1
	if [ -d "/etc/network-manager" -o -d "/etc/NetworkManager" ]; then
		echo -e "\e[1;32m[+] Network-manager is installed.\e[0m\n"

	else
		echo -e "\e[1;31m[!] Network-manager isn't installed. Installing it...\e[0m"
		apt update -y -qq
		apt install network-manager -y -qq
		sleep 1

		if [ -d "/etc/network-manager" -o -d "/etc/NetworkManager" ]; then
			echo -e "\e[1;32m[+] Network-manager installed.\e[0m\n"

		else
			echo -e "\e[1;31m[!] Network-manager can't be installed. Verify if you're connected to Internet and try again later.\n\nExiting...\e[0m"
			sleep 3
			exit

		fi

	fi

	sleep 1
	echo -e "\e[1;34m[i] Press [ENTER] to continue.\e[0m"
	read enter > /dev/null

	#Checking if RTL88x2BU driver is downloaded:
	echo -e "\e[1;33m[*] Checking if RTL88x2BU driver is downloaded...\e[0m"
	sleep 1
	driver=$HOME/.RTL88x2BU-Linux-Driver/
	if [ -d "$driver" ]; then
		echo -e "\e[1;32m[+] RTL88x2BU driver is downloaded.\e[0m\n"

	else
		echo -e "\e[1;31m[!] RTL88x2BU driver isn't downloaded. Downloading it...\e[0m"
		git clone https://github.com/RinCat/RTL88x2BU-Linux-Driver -q
		sudo mv RTL88x2BU-Linux-Driver $HOME/.RTL88x2BU-Linux-Driver/
		sleep 1

		if [ -d "$driver" ]; then
			echo -e "\e[1;32m[+] RTL88x2BU driver downloaded.\e[0m\n"

		else
			echo -e "\e[1;31m[!] RTL88x2BU driver can't be downloaded. Verify if you're connected to Internet and try again later.\n\nExiting...\e[0m"
			sleep 3
			exit

		fi

	fi

	sleep 1
	echo -e "\e[1;34m[i] Press [ENTER] to continue.\e[0m"
	read enter > /dev/null

	echo -e "\e[1;37m==========> INSTALLING DRIVER <==========\e[0m\n"

	echo -e -n "\e[1;34m[i] Please, plug your RTL88x2BU in any USB port. After do that, press [ENTER] to continue.\e[0m\n"
	read enter > /dev/null

	#Listing USB devices:
	cdev() {
		echo -e "\e[1;33m[*] Checking if RTL88x2BU is connected...\e[0m"
		sleep 1
		lsusb | grep -i "rtl"
		echo -e -n "\e[1;34m[i] Is the device showed above your RTL88x2BU? [y/n]\e[1;37m >>> "

		read yn
		case $yn in
			y|Y|yes|YES) ;;
			n|N|no|NO) echo -e "\n\e[1;34m[i] Please, try plug your RTL88x2BU in another USB port. After do that, press [ENTER] to continue.\e[0m"
				sleep 1
				read enter > /dev/null
				cdev;;
			*) echo -e "\e[1;31m[!] '$yn' is an invalid option!\e[0m\n"
				cdev;;

		esac

	}
	cdev

	#Building RTL88x2BU driver:
	echo -e "\n\e[1;34m[i] Press [ENTER] to start installation. NOTE: This can take several minutes!\e[0m"
	read enter > /dev/null
	cd $driver
	make > /dev/null &
	PID=$!
	cnt=1
	spin="|/-\\"
	echo -e -n "\e[1;33m[*] Building driver...  "
	while [ -d /proc/$PID ]; do
		echo -e -n "\b${spin:cnt++%${#spin}:1}"
		sleep 0.25

	done
	echo -e -n "\bDONE!\e[0m\n"

	#Installing RTL88x2BU driver:
	make install > /dev/null &
	PID=$!
	cnt=1
	spin="|/-\\"
	echo -e -n "\e[1;33m[*] Installing driver...  "
	while [ -d /proc/$PID ]; do
		echo -e -n "\b${spin:cnt++%${#spin}:1}"
		sleep 0.25

	done
	echo -e -n "\bDONE!\e[0m\n"
	cd - > /dev/null

	#Starting RTL88x2BU driver and restarting network-manager:
	echo -e "\n\e[1;34m[i] Press [ENTER] to activate your RTL88x2BU. NOTE: Your network connection will be restarted and this can take some seconds!"
	read enter > /dev/null
	modprobe 88x2bu
	if [ -d "/etc/network-manager" ]; then
		service network-manager restart

	else
		service NetworkManager restart

	fi

	sleep 1
	echo -e "\e[1;34m[i] Setup completed successfully! Press [ENTER] exit setup.\e[0m"
	read enter > /dev/null
	clear

	#Driver developers credits:
	echo -e "\n\e[1;37m==========> SUPPORT DRIVER CREATORS!!!!!! <==========\e[0m\n"

	echo -e "\e[1;31m[❤️]\e[1;37m Please, \e[1;36mcontribute\e[1;37m, send so much \e[1;31mlove <3\e[1;37m and \e[1;32msupport\e[1;37m \e[1;34mRin Cat\e[1;37m and \e[1;34mMatin Lotfaliee\e[1;37m (RTL88x2BU driver developers)!!!!\e[0m\n"

	echo -e "\e[1;37;44m ·Driver project repo ---------> https://github.com/RinCat/RTL88x2BU-Linux-Driver "
	echo -e "\e[1;37;44m ·Rin Cat GitHub page ---------> https://github.com/RinCat                        "
	echo -e "\e[1;37;44m ·Matin Lotfaliee GitHub page -> https://github.com/matinlotfali                  "
	echo -e "\e[0m"

	sleep 2

fi

#End of script :p
