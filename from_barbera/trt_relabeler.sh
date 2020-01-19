#!/bin/bash

# Name: trt_relabeler.sh

# Description: This script reads from a file named 'SraRunTable.txt' in the
#       current directory and relabels raw short reads with their corr-
#       esponding treatment names. 

# Usage: <trt_relabeler.sh> (column No. for "Run" field) (column No. for "Treatment")



# Read each sample in "SraRunTable.txt", line by line
for i in $(cat SraRunTable.txt); do

        # set variables in the for loop to read from the 1st two arguments
        RUN_COLUMN=$1
        RUN=$(cut -f "$RUN_COLUMN") # possibly redundant
	echo "Run Column = $RUN_COLUMN"
	echo "Run number = $RUN"
        TRT_COLUMN=$2
        TRT=$(cut -f "$TRT_COLUMN")
	echo "Treatment Column = $TRT_COLUMN"
	echo "Treatment number = $TRT"


        # search through the working dir to rename all matching $RUN's
        #   with corresponding $TRT strings
        for j in $(ls | grep <<< $RUN); do
		echo "Processing $j..."
		mv $j $(echo "$j" | sed "s/$RUN/$TRT/")
            done
    done
