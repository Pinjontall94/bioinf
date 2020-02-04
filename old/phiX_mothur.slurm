#!/bin/bash
#SBATCH --partition=production
#SBATCH --job-name=phix_screen # this can be changed to whatever you want
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --time=04:00:00  # 4 hours should be sufficient for each data set
#SBATCH --output=phix.out # this can be changed to whatever you want
#SBATCH --error=phix.err # same as above
#SBATCH --mail-user=sbjohnson@ucdavis.edu # put in your email address
#SBATCH --mail-type=ALL

aklog 

date

./mothur batch.txt

date

