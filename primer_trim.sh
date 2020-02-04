#!/bin/bash
# primer_trim.sh

# Takes the primer patterns in the directory above 
# $(pwd), inputs to cutadapt, and loops through all fasta # files in $(pwd)

F=$(head -n 1 ../*primers.txt | grep -Eo "[A,C,G,T][^\(,\]]*[A,C,G,T]")

R=$(tail -n 1 ../*primers.txt | grep -Eo "[A,C,G,T][^\(,\]]*[A,C,G,T]")

module load cutadapt/2.0

for x in *.fasta; do
m=$(basename $x | sed 's/\.fasta//')

cutadapt -g $F -o $m.temp.fasta $x --discard-untrimmed

cutadapt -a $R -o $m.trimmed.fasta $m.temp.fasta --discard-untrimmed

done
