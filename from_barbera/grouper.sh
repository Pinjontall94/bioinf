#!/bin/bash
# grouper.sh

# Description: A script that takes .fastq or .fastq.gz files in a directory and
# 		creates corresponding folders for those matching a regex
# 		pattern (and does _not_ duplicate with forward and reverse
# 		reads, crucially)

fastqRegex="\<\S+\.fastq"

for i in $(ls -l | grep -Eo $fastqRegex); do
	g=$(echo $i | sed 's/_[1-2]\.fastq.*//g') # group name trims the read
						  #  and file extension
	if [ -d "$g" ]; then
		continue
	else
		touch "$g"
	fi
done
