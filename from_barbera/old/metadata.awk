#!/bin/bash

# Example metadata file generator for SraRunTable.txt

if [ -f SraRunTable.txt ]; then
INPUT=SraRunTable.txt

awk '
	BEGIN { FS="\t" }; 
	{ print "Huang_2016",$10,$27,$12,$26,$30 }
' $INPUT 
	| sed '1s/Huang_2016/Study/'
	> Huang_2016_metadata.txt
fi
