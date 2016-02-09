#!/bin/bash
mhcpversion="1.0.0 alpha"


	echo
	echo
	echo "STAGE 1"
	echo "====================================================================="
	echo
	echo "--------------------MSHCP PRE-INSTALLER $mhcpversion ----------------"
	echo "-----Easy Hosting Control Panel for Minecraft Server Hostings--------"
	echo "-------------------------www.tecflare.com----------------------------"
	echo "---------------------------------------------------------------------"
	echo
	echo
    echo "This installation will be installing the MSHCP $mhcpversion and will take a long time so please be patient."
    echo
    echo
    if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   echo "Please type sudo sh install.sh"
   echo "The Script will now exit with error code 1"
   exit 1
fi
  read -n1 -r -p "Press any key to continue..."
  clear
  echo "Installing Required Packages..."
  apt-get -qq -y upgrade
  sudo apt-get install nodejs
sudo apt-get install npm
