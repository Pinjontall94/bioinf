#!/bin/bash
# 
# A simple script to determine whether srr_munch.sh has already been run in
# a directory (to be used in batch_srr.sh). Use this script in a directory 
# containing short read accession lists, labeled "SRR_Acc_List.txt". 
#
# usage: betterr.sh



if [ -e "SRR_Acc_List\(*.txt" ]; then
        mkdir originals
        mv SRR_Acc_List.txt 'SRR_Acc_List(0).txt'
        cat SRR_Acc_List\(*.txt > SRR_Acc_List.txt 
        mv SRR_Acc_List\(* originals/
fi

# List
L=$(ls | grep "SRR_Acc_List.*\.txt")

if [ -z $(ls | grep $(tail -n 1 $L)) ]; then
        echo "Directory already processed"
else    
        echo "Outstanding files"
	f=$(ls -t | head -n 1)
	g=$(grep $f $L)
	echo "f: $f" && echo "g: $g"
	echo "rm $(ls -t | head -n 1)"
	echo "srr_munch.sh"
fi


# srr_munch.sh
while read x; do
        fastq-dump --split-3 --gzip $x
        for i in *.fastq.gz; do
                gzip -d $i
                done            
done < $(ls | grep "SRR_Acc_List.*\.txt")
