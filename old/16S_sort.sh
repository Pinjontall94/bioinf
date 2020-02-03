#!/bin/sh

# Description: shell script to filter out sequences by treatment data, placing
# 	matches in a separate folder. Used here to pattern match against "16S"
#	sequences.

if [ -d "original" ]; then
	mkdir 16S
	for i in $(cat 16S_list.txt); do
		mv fastqs/$i -t 16S
	done
else 
	echo "Error: working directory not in <data set>/original"
fi


