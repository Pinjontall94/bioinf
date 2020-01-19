#!/bin/bash

# Name: trt_relabeler.sh

# Description: This script reads from a file named 'SraRunTable.txt' in the
#       current directory and relabels raw short reads with their corr-
#       esponding treatment names. 

# Usage: <trt_relabeler.sh> (column No. for "Run" field) (column No. for "Treatment")

# Set Vars from command line
RUN_COLUMN=$1
TRT_COLUMN=$2
INPUT_FILE=$(head -n -1 SraRunTable.txt)

# Read each sample in "SraRunTable.txt", line by line
while IFS= read -r f9 f11; do

        # set variables in the for loop to read from the 1st two arguments
	RUN=$(cut -f "$RUN_COLUMN" $i) # possibly redundant
	echo "Run Column = $RUN_COLUMN"
	echo "Run number = $RUN"
	TRT=$(cut -f "$TRT_COLUMN" $i)
	echo "Treatment Column = $TRT_COLUMN"
	echo "Treatment number = $TRT"

        # search through the working dir to rename all matching $RUN's
        #   with corresponding $TRT strings
#	for j in $(ls | grep <<<"$RUN" ); do
#		echo "Processing $j..."
#		mv $j $(echo "$j" | sed "s/$RUN/$TRT/")
#            done
    done < "$INPUT_FILE"
