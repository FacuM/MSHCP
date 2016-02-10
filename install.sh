#!/bin/bash
mhcpversion="1.0.0 alpha"

spinner()
{
    local pid=$!
    local delay=0.75
    local spinstr='+-!;&'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

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
   if [[ "$OSTYPE" == "linux-gnu" ]]; then
  linuxosis="linux"
          echo "Operating System detected is $OSTYPE"
          echo "Installing Required Packages..."
  sudo apt-get -qq -y upgrade & spinner
  sudo apt-get -qq -y install nodejs & spinner
  sudo apt-get -qq -y install npm & spinner
  sudo apt-get -qq -y install php5 & spinner
  elif [[ "$OSTYPE" == "darwin"* ]]; then
         echo "This operating system is unsupported!"
        echo
        echo "I recommend you install Ubuntu."
        exit 1;
  elif [[ "$OSTYPE" == "cygwin" ]]; then
         echo "This operating system is unsupported!"
        echo
        echo "I recommend you install Ubuntu."
        exit 1;
  elif [[ "$OSTYPE" == "msys" ]]; then
         echo "This operating system is unsupported!"
        echo
        echo "I recommend you install Ubuntu."
        exit 1;
  elif [[ "$OSTYPE" == "freebsd"* ]]; then
        linuxosis="freebsd"
        echo "Operating System detected is $OSTYPE"
        sudo yum -y install epel-release & spinner
        sudo yum -y install nodejs & spinner
          sudo yum -y install php5 & spinner
  else
        echo "This operating system is unsupported!"
        echo
        echo "I recommend you install Ubuntu."
        exit 1;
  fi

       
        
  chmod 777 web & spinner
  sudo cp -r web /var/ & spinner
  nohup php -S 0.0.0.0:9012 -t /var/web &
  cp mshcp /etc/init.d/ & spinner
  sudo chmod 777 /etc/init.d/mshcp & spinner
       
