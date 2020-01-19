#!/bin/bash
# flash2_merge.sh
# Desc: A simple script that runs flash2 to merge all fastqs in the current
# 	directory.

flashSeq(){
	if [[ -x "flash2" || "$PATH/flash2" ]]; then 
		echo "FLASh found, executing..."
		for i in *_1.fastq; do			# Merge all _1 & _2 fastqs
			REV=$(basename "$i" \
				| sed 's/_1\.fastq/_2.fastq/')
			echo "$i" "$REV"
			flash2 "$i" "$REV" 2>&1	\
				-o $(basename "$i" | sed 's/_1\.fastq/.flash/') \
				| tee -a flash.log
			done
		for i in *_R1.fastq; do			# Merge the R1/R2 reads -___-
			REV=$(basename "$i" \
				| sed 's/_R1\.fastq/_R2.fastq/')
			echo "$i" "$REV"
			flash2 "$i" "$REV" 2>&1 \
				-o $(basename "$i" | sed 's/_R1\.fastq/.flash/') \
				| tee -a flash.log
			done
	fi
}

#for i in *; do
#	cd "$i"/original/fastqs/16S
	flashSeq
#	cd ../../../../
#done
