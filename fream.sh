#!/bin/bash

# </ By Multtimy >

# Colors
red="\e[01;31m"; green="\e[01;32m"; yellow="\e[01;33m";
blue="\e[01;34m"; cyan="\e[01;36m"; end="\e[00m";

# Function Cancel
CTRL_C(){
   echo -e "\n${blue}>>> ${red}Process Canceled ${blue}<<<${end}"
   tput cnorm
   exit 0
}
trap CTRL_C INT

# Function Animation
ANIMATION(){
   declare -i local count=1
   while [[ $count -le 11 ]]; do
         echo -e "${yellow}▮${end}\c"; sleep 0.3
         count=$[${count}+1]
   done
   echo
}

# Function Scann RAM
SCANNRAM(){
   local freeRAM=$(free --human --si | grep 'Mem' | awk '{print $4}')
   local usedRAM=$(free --human --si | grep 'Mem' | awk '{print $3}')
   echo -e "${cyan}┌〉${yellow}Status of the memory ${1}${red}RAM${end}"
   echo -e "${cyan}├〉${yellow}Free RAM${cyan}⌥  ${green}${freeRAM} ${yellow}Used RAM${cyan}⌥  ${green}${usedRAM}${end}"
}

# Function reloading ram
RELOADING(){
   declare -i local count=1
   while [[ $count -le 3 ]]; do
         echo -e "${blue}▮▮▮${end}\c"; sleep 0.8
         `sudo sync && sudo sysctl -w vm.drop_caches=3 >/dev/null 2>&1`
         count=$[${count}+1]
   done
   echo
}

# main Function
init(){
   if [[ $(id -u) -eq 0 ]]; then
      clear && tput civis && sleep 0.4
      echo -e "${green}Scanning ${red}RAM ${end}\c"; ANIMATION
      SCANNRAM
      echo -e "${cyan}└〉${yellow}Releasing RAM ${end}\c"; RELOADING
      SCANNRAM "${green}current ${end}"
      echo -e "${cyan}└〉${green}done${end}"
      tput cnorm
   else
     echo -e "${red}Error of Permissions${end}\c"
     echo -e "${blue} Use${yellow}: ${green}sudo ${cyan}./fram.sh${end}"
   fi
}

init
