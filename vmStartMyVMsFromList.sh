#!/bin/bash
echo " "
echo "Starting VMs from the list in the file: vmMyListToStart.txt - with 45 seconds delays"
echo " "
cat vmMyListToStart.txt
echo " "
# xargs -0 -n 1 ls -la < <(tr \\n \\0 <vmMyListToStart.txt)
# grep vmx vmMyListToStart.txt | xargs -I % sh -c '{ ls -la %; sleep 1; }'
grep vmx vmMyListToStart.txt | xargs -I % sh -c '{ vmrun start % nogui; sleep 45; }'
echo "DONE."
echo " "
