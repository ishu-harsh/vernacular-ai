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

