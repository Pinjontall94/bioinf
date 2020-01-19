#!/bin/sh

for i in $(ls); do

	cd $i 
	mothur_prep.sh
	cd ..

done
