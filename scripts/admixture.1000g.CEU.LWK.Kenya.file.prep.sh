#!/bin/bash
#SBATCH -n 2
#SBATCH --job-name=admixture.1000g.CEU.LWK.Kenya.file.prep
#SBATCH -t 2-0:0
#SBATCH -o slurm.admixture.1000g.CEU.LWK.Kenya.file.prep.out
#SBATCH -e slurm.admixture.1000g.CEU.LWK.Kenya.file.prep.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=amtarave@asu.edu
date
# Activate appropriate conda environment
source activate genetic_diff_kenya

#############
# VARIABLES #
#############
# Merged file directory
mergedir="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/02_analyses/04_1000G_Kenya/processed_files/merged/"
# Merged file stem name
mergestm="MERGED.Kenya.Array.1000G.MAF0.1"
# LD prune parameters
LDPRN1="50" # SNP window size
LDPRN2="10" # SNP step size for sliding window
LDPRN3="0.2" # removal each SNP that has an R2 value of greater than this value
# Sample list of the Kenya array samples and 1000 genomes African samples
KEEPFIL="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/lists/Kenya.CEU.LWK.sample.list.txt"



# Extract desired samples for ADMIXTURE analysis. This will be all indvividuals
# from CEU, LWK, and Kenya
# Autosomes #
plink --bfile ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3} --keep ${KEEPFIL} --make-bed --out ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.Kenya.CEU.LWK
# X chromsome #
plink --bfile ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3} --keep ${KEEPFIL} --make-bed --out ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.Kenya.CEU.LWK

date

# Deactivate conda environment
source deactivate genetic_diff_kenya
