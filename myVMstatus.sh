#!/bin/bash
echo 
free -hw |head -2
echo 
# echo "Total memory available in the machine in MegaBytes:"
# free -m | head -2 | tail -1 | awk '{print $2}'
TotMem=`free -m | head -2 | tail -1 | awk '{print $2}'`
echo " Memory available in the machine:" $TotMem "MB "
# echo "Total memory allocated to running VMs in MegaBytes:"
# vmrun list | grep vmx | sort |xargs grep -i memsize | awk '{print $3}' | tr -d \" | paste -s -d+ - | bc
VMsMem=`vmrun list | grep vmx | sort |xargs grep -i memsize | awk '{print $3}' | tr -d \" | paste -s -d+ - | bc`
VMsMeP=`expr 100 \* $VMsMem / $TotMem`
echo " Memory allocated to running VMs:" $VMsMem "MB =" $VMsMeP "% "
AvailM=`expr $TotMem - $VMsMem`
AvailP=`expr 100 \* $AvailM / $TotMem`
echo " Still available memory for user: " $AvailM "MB =" $AvailP "% "
echo 
vmrun list |head -1
echo 
