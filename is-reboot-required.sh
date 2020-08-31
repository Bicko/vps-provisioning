#!/bin/bash
 
if [ -f /var/run/reboot-required ]
then
        echo 'reboot is required'
else
        echo 'no'
fi
