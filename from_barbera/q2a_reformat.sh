#!/bin/sh

for i in *.fastq; do
	reformat.sh in=$i out=$(basename $i | sed 's/fastq/fasta/')
done
