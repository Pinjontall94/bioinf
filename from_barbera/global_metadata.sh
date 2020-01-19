#!/bin/bash

# Description: A script to grab the header columns of all SraRunTable files in 
# 		all subdirectories. After collating all common fields, a 
#		standard field list for the global metadata file for all	
#		studies will emerge

for i in $(ls); do
	cd $i
	for j in $(ls); do
		if [ -f SraRunTable* ]; then 
			head -n 1 $j >> ../../global_metadata_fields.txt
		else 
			continue
		fi
	done
done
