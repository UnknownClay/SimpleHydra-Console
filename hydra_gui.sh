#!/bin/bash

##
# BASH menu script simple hydra
#   - http
#   - FTP
#   - SSH
#   - SMTP
#   - RDP
#   - SMB
#   - POP3
##

function http() {
    echo ""
    	clear
    	cowsay -f tux  http
	echo -e "\e[1;34mUseage: User.txt Pass.txt 192.168.1.1 8080 /CgiUserLogin?Language=0"
	read user pass ip port auth
	hydra -L $user -P $pass -e ns -f -V $ip -s $port http-get $auth
	echo ""
}

function FTP() {
    echo ""
    	clear
    	cowsay -f tux  FTP
	echo -e "\e[1;34mUseage: User.txt Pass.txt 192.168.1.1"
	read user pass ip
	hydra -t 5 -L $user -P $pass -vV $ip ftp
	echo ""
}

function SSH() {
    echo ""
    	clear
    	cowsay -f tux  SSH
	echo -e "\e[1;34mUseage: User.txt Pass.txt 192.168.1.1"
	read user pass ip
	hydra -v -V -u -L $user -P $pass -t 5 -u $ip ssh
	echo ""
}

function SMTP() {
    echo ""
    	clear
    	cowsay -f tux  SMTP
	echo -e "\e[1;34mUseage: Pass.txt 192.168.1.1"
	read pass ip
	hydra -P $pass $ip smtp -V
	echo ""
}

function RDP() {
    echo ""
    	clear
    	cowsay -f tux  RDP
	echo -e "\e[1;34mUseage: User.txt Pass.txt 192.168.1.1"
	read user pass ip
	hydra -t 1 -V -f -L $user -P $pass rdp://$ip
	echo ""
}

function SMB() {
    echo ""
    	clear
    	cowsay -f tux  SMB
	echo -e "\e[1;34mUseage: User.txt Pass.txt 192.168.1.1"
	read user pass ip
	hydra -t 1 -V -f -L $user -P $pass $ip smb
	echo ""
}

function POP3() {
    echo ""
    	clear
    	cowsay -f tux  POP3
	echo -e "\e[1;34mUseage: User.txt Pass.txt 192.168.1.1"
	read user pass ip
	hydra -l $user -P $pass -f $ip pop3 -V
	echo ""
}

##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}

menu(){
clear
cowsay -f tux  Hydra GUI
echo -ne "
$(ColorGreen '1)') http
$(ColorGreen '2)') FTP
$(ColorGreen '3)') SSH
$(ColorGreen '4)') SMTP
$(ColorGreen '5)') RDP
$(ColorGreen '6)') SMB
$(ColorGreen '7)') POP3
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option:') "
        read a
        case $a in
	        1) http ; menu ;;
	        2) FTP ; menu ;;
	        3) SSH ; menu ;;
	        4) SMTP ; menu ;;
	        5) RDP ; menu ;;
            	6) SMB ; menu ;;
            	7) POP3 ; menu ;;
		0) exit 0 ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}

# Call the menu function
menu
