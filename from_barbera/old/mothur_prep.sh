#!/bin/sh    
# Description: A script to take any fastq or gzipped fastq files in a working directory to prepare    
#   unmerged reads for OTU clustering. This script produces the tab-delimited list file, needed by    
#   mothur's make.contigs function (used here in mothur/mothur.slurm)    

# Notes for later: trim the _(1|2) from the first column (just give the group name, i.e. SRR[:number:]*)
#   Also, make sure the for loop ignores duplicates, so the group isn't called twice!
    
# For any valid, unmerged fastq file (gzipped or uncompressed)...
for i in $(ls -l | grep -Eo "\<\S*_(R|)(1|2)\S*\.fastq(|\.gz)"); do   
        echo "processing $i..."                                                      
                                                                            
        U=$(echo "$i" | sed 's/_(1|2)\.fastq.*//') # Unique Identifier            
        echo "U = $U"                                                                  
                                                                                       
        F=$(echo "$i" | sed 's/_1\.fastq/_R1_001\.fastq/' | sed 's/_2\.fastq/_R1_001\.fastq/') # First Read Field            
        echo "F = $F"                                                  
                                                                                                                        
        S=$(echo "$F" | sed 's/R1_001\.fastq/R2_001\.fastq/') # Second Read Field                                                             
        echo "S = $S"                                                                                                   
                                                                                                                        
        echo "$U" "$F" "$S" | sed 's/\s\+/ /g' | sed 's/\s/\t/g' >> samples.txt # Append to sample list file            
        echo "finished processing $i"                
done                    
