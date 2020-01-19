#!/bin/bash

# Descr: Pulls unmerged samples into specific subdirectories (with assoc. 
# 	 'samples.txt') for use with mothur

for d in $(ls); do
	cd $d
	if [ ! -f 1_names.txt ] || continue; then do
		if [ -f *_1* ] || continue; then do
#			ls *_1* > 1_names.txt
#			ls *_2* > 2_names.txt
#			sed 's/_1.*//g' 1_names.txt > grp_names.txt
#			paste grp_names.txt 1_names.txt 2_names.txt > samples.txt
#			mkdir set_to_merge
#			mv *_1* *_2* samples.txt -t set_to_merge
			done
		fi
		done
	fi
	cd ..
done
