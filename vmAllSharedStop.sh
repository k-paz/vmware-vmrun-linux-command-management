#!/bin/bash
### optional - saving currently running VMs to the file for having batch statup list
# vmrun list | grep vmx > vmMyListToStart.txt
### testing #
# vmrun list | grep "Total running VMs: 0" > /dev/null 2>&1 || vmrun list | sed -e '1d' | while read line; do ls -al "$line"; done
### actual commands #
# vmrun list | grep "Total running VMs: 0" > /dev/null 2>&1 || vmrun list | sed -e '1d' | while read line; do vmrun suspend "$line"; done
vmrun list | grep "Total running VMs: 0" > /dev/null 2>&1 || vmrun list | sed -e '1d' | while read line; do vmrun stop "$line"; done
# done
