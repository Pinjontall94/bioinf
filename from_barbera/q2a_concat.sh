#!/bin/sh

# q2a_concat.sh
# Description: Takes a list of fastq files in the current directory and derives
# 	a single, concatenated fasta file from them

if [ ! -d fastas ]; then
	mkdir fastas
fi

for i in *.fastq; do
	paste - - - - < $i | cut -f 1,2 | sed 's/\@/>/g' | tr "\t" "\n" > fastas/$(basename $i .fastq).fasta
done

cd fastas
cat *.fasta > concat.fasta
cd ..
