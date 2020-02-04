#!/bin/sh
# Description: A script to take any fastq or gzipped fastq files in a working directory to prepare
#   unmerged reads for OTU clustering. This script produces the tab-delimited list file, needed by
#   mothur's make.contigs function (used here in mothur/mothur.slurm)

# Read each line from $(ls); if it contains ".fastq":
#   1) echo the name minus the read number and file extension, 
#      followed by the full name with "R1_001" before the extension,
#      followed the same (with "R2_001" instead).
#
#   2) Pipe this echo through sed to convert spaces 
#      (per "echo SRR[whatever]_1 SRR[whatever]_1_R1_001.fastq SRR[whatever]_1_R2_001.fastq").
#
#   3) Append this output to a new file called "samples.txt"

for i in $(ls -l | grep -Eo "\<\S*_(1|2)\S*\.fastq(|\.gz)"); do                                                    
	echo "processing $i..."
	
	U=$(echo "$i" | sed 's/\.fastq.*//') # Unique Identifier
	echo "U = $U"

	F=$(echo "$i" | sed 's/\.fastq/_R1_001\.fastq/') # First Read Field
	echo "F = $F"

	S=$(echo "$F" | sed 's/R1/R2/') # Second Read Field
	echo "S = $S"

	echo "$U" "$F" "$S" | sed 's/\s\+/ /g' | sed 's/\s/\t/g' >> samples.txt # Append to sample list file
	echo "finished processing $i"
done
