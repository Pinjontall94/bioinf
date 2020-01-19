#!/bin/bash

# Another way to rename short read fastq files, based on corresponding treatment
# data columns in the SraRunTable text file (from NCBI)

for i in $(ls); do
	LNK=$(grep $i SraRunTable.txt | awk '{ $OPTION $EXAMPLE }')
	mv $i $LNK
