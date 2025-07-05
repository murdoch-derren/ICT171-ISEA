#!/bin/bash

read -p "How many times to loop for? " i

for ((c=1;c<=$i;c++)); do
	echo "======== CPU USAGE ========"
	top -b -n1 | grep -i "cpu(s)"
	echo -e "\n\n"

	echo "======== MEM USAGE ========"
	free -h
	echo -e "\n\n"

	echo "======== DISK USAGE ========"
	df -h | grep -i "^/dev"
	echo -e "\n\n"

	echo "Press Ctrl+C to exit."

	sleep 5
	clear
done
