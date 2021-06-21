#!/bin/bash

echo "eneumeration" | cowsay | lolcat

echo "note: uniscan functionality requires password entry unless script is ran as root"

printf "#Enter name of workspace folder /home/anon/Workspace/* \n>"

	read workspacefolder

	cd /home/alex/Workspace/$workspacefolder


printf "#Enter RHOST w/o additional formatting \n>"

	read preRHOST

	RHOST="http://${preRHOST}/"

printf "#Enter wordlist size for gobuster small/medium/large/dirb_default/custom\n>"
	        read wordlistsize
                if [ $wordlistsize == "small" ]
                        then
                        wordlist="/usr/share/wordlists/dirbuster/directory-list-2.3-small.txt"
                elif [ $wordlistsize == "medium" ]
                        then
                        wordlist="/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt"
                elif [ $wordlistsize == "large" ]
                        then
                        wordlist="/usr/share/wordlists/dirb/big.txt"
                elif [ $wordlistsize == "dirb_default" ]
			then
			wordlist="/usr/share/wordlists/dirb/common.txt"
		elif [ $wordlistsize == "custom" ]
			then
			printf "Enter absolute path to custom wordlist\n"
			read customWordlist
			wordlist=customWordlist
fi
	printf "#Do you want to use brute force extensions too? yes/no(default) (you can master quantum physics while you wait)\n>"
	read extensions

if [ extensions == "yes" ]
then
extention="-x /usr/share/wordlists/dirb/extentions-common.txt"
fi
echo $wordlist

gnome-terminal --tab -e "bash -c 'nikto -h ${RHOST} ; bash'"

gnome-terminal --tab -e "bash -c 'gobuster dir -u ${RHOST} -w ${wordlist} ${extension} ; bash'"

gnome-terminal --tab -e "bash -c 'nmap -p 1-65535 -T4 -A -v ${RHOST}'"

gnome-terminal --tab -e "bash -c 'sudo uniscan -u ${RHOST} -qweds ; bash'"

exit 0
