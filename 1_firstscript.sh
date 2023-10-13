#!/bin/bash

#### This script prints system info ####
echo "Wecome to bash script."
echo
echo "##################################"

# checking system uptime
echo "The uptime of the system is: "
uptime
echo
echo "##################################"

# Memory utilization
echo "Memory Utilization"
free -m
echo
echo "##################################"


echo "Disk Utilization"
df -h
