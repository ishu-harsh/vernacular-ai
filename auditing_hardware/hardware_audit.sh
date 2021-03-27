#!/bin/bash 

# OS Version
echo "$(tput setaf 2) OS version : $(tput sgr0)"  && cat /etc/redhat-release


# Kernel Version
echo "$(tput setaf 2) Kernel version : $(tput sgr0)"  && uname -r 

# CPU Cores
PHYSICAL_CORES="$(cat /proc/cpuinfo | grep  "processor" | wc -l)"
VIRTUAL_CORES="$(cat /proc/cpuinfo |grep "cpu cores" | awk -F: '{ num+=$2 } END{ print num }')"
echo "$(tput setaf 2) CPU - Virtual cores :$(tput sgr0)"  && cat /proc/cpuinfo |grep "cpu cores" | awk -F: '{ num+=$2 } END{ print "cpu cores", num }'
echo "$(tput setaf 2) Ratio to physical cores [Virtual : Physical]: $(tput sgr0) [ $VIRTUAL_CORES : $PHYSICAL_CORES]"

#CPU Clock Speed 
echo "$(tput setaf 2) CPU - Clock speed : $(tput sgr0)"  && lscpu | grep MHz 

#CPU Architecture

echo "$(tput setaf 2) CPU Architecture : $(tput sgr0)"  &&  lscpu | grep "Architecture" | awk '{print $2}'

# RAM

echo "$(tput setaf 2) RAM : $(tput sgr0)"  &&  cat /proc/meminfo | grep "MemTotal" | awk '{ byte =$2 /1024/1024; print byte " GB" }'

# Disk - Mounted/Unmounted volumes, type, storage

echo "$(tput setaf 2) Disk - Mounted/Unmounted volumes, type, storage : $(tput sgr0)"  && df -aTH


# Networking - Network Firewall (Allowed Ports & Protocols)
if [[ `  systemctl  status firewalld.service | grep Active | awk '{print $2}' ` = inactive ]] 
then
     echo "$(tput setaf 2) Networking - Network Firewall (Allowed Ports & Protocols) :  $(tput sgr0)" && echo -e "\e[31mFirewalld is Inactive\e[0m"
else
    echo "$(tput setaf 2) Networking - Network Firewall (Allowed Ports & Protocols) :  $(tput sgr0)"  && echo "Allowed Ports :$(firewall-cmd --list-ports)" && echo "Allowed Protocols :$(firewall-cmd --list-protocols)"
fi


# Networking - OS Firewall (Allowed Ports & Protocols)
 echo "$(tput setaf 2) Networking - OS Firewall (Allowed Ports & Protocols) :  $(tput sgr0)"  && ufw status verbose


 # Bandwidth
 echo "$(tput setaf 3) Wait 10 Second For Bandwidth $(tput sgr0)"
 iperf -c 172.217.174.78 -t 10 -p 80 -f Mbits  -w 40k > /tmp/band.txt
 echo "$(tput setaf 2) Bandwidth :  $(tput sgr0)"  && cat /tmp/b.txt  | grep -o -P '.{0,6}MBytes/sec{0,6}'