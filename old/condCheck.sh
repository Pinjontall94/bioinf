#!/bin/bash

shopt -s nullglob
for f in *.txt; do 
	if [ ! -z $(grep -o "SRP[^\)]*" $f) ]; then
		echo "SRP found in file $f"
	else 
		echo "No SRP found in file $f"
	fi
done
