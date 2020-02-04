#!/bin/bash
#SBATCH --partition=production
#SBATCH --job-name=phix # this can be changed to whatever you want
#SBATCH --nodes=1
#SBATCH --ntasks=20
#SBATCH --time=04:00:00  # 4 hours should be sufficient for each data set
#SBATCH --output=phix.out # this can be changed to whatever you want
#SBATCH --error=phix.err # same as above
#SBATCH --mail-user=sbjohnson@ucdavis.edu # put in your email address
#SBATCH --mail-type=ALL

aklog 

date

module load bowtie2/2.3.3
bowtie2 -x /share/amishalab-backedup/PoretPeterson/PhiX/PhiX_bowtie_db* -f -U samples.trim.contigs.fasta -S merged.bowtie --un merged.screened --al merged.PhiX --local -p 20

date
