#!/bin/bash

# List
L=$(ls | grep "SRR_Acc_List.*\.txt")

if [ -e "$(tail -n 1 $L).fastq" ]; then
	echo "Directory already processed"
else
	echo "Outstanding files"
fi

