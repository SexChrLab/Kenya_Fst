#!/bin/bash
#SBATCH -n 2
#SBATCH --job-name=haplogroup.assignments
#SBATCH -t 2-0:0
#SBATCH -o slurm.haplogroup.assignments.out
#SBATCH -e slurm.haplogroup.assignments.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=amtarave@asu.edu
date
# Activate appropriate conda environment
source activate genetic_diff_kenya
cd /scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/scripts

#############
# VARIABLES #
#############
# Directory to cleaned and filtered Y chromosome stem file
ydir="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/01_filtering_new/all_samples/chr24/"
# Cleaned and filtered Y chromosome stem file
ystem="melissa_wilson.raw.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr24.setMaleHetsMissing.geno0.05.hwe1e-50.MALES"
# Directory to cleaned and filtered mtDNA stem file
mtdnadir="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/01_filtering_new/all_samples/chr26/ALL/"
# Cleaned and filtered mtDNA stem file
mtdnastem="melissa_wilson.raw.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr26.setHetsMissing.geno0.05.hwe1e-50.ALL"
# Path and file name of hg19 reference genome. To be used in snpflip step
hg19fa="/mnt/storage/SAYRES/REFERENCE_GENOMES/Homo_sapiens_assembly19/Homo_sapiens_assembly19.fasta"
# Directory of output files
# mtDNA
outmtdnadir="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/02_analyses/07_mtDNA_haps/all_samples/"
# Y chromsome
outydir="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/02_analyses/08_y_haps/all_samples/"
# Y chromosome YHap run directory. For some reason YHap wont run properly if it
# is not in this directory.
yhaprundir="/home/amtarave/projects/genetic_diff_northern_kenya/test_haplogroups/ychr/YHap/rundir/"
yhapvcfdir="kenyaYflipped/" # Make sure Y vcf goes here
# haplogrep directory
hapgrpdir="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/02_analyses/07_mtDNA_haps/haplogrep-cmd/"

################################################################################

########
# CODE #
########

##########
# Step 1 #
##########
# Run snpflip to get the array snps oriented to the correct strand (strand that
# matches the reference genome)
# Y chromosome #
#snpflip --fasta-genome=${hg19fa} --bim-file=${ydir}${ystem}.bim --output-prefix=${ydir}${ystem}.strand.assignments

# mtDNA #
#snpflip --fasta-genome=${hg19fa} --bim-file=${mtdnadir}${mtdnastem}.bim --output-prefix=${mtdnadir}${mtdnastem}.strand.assignments

##########
# Step 2 #
##########
# Flip snps using plink
# Y chromsome #
plink --bfile ${ydir}${ystem} --flip ${ydir}${ystem}.strand.assignments.reverse --make-bed --out ${ydir}${ystem}.flipped

# mtDNA #
plink --bfile ${mtdnadir}${mtdnastem} --flip ${mtdnadir}${mtdnastem}.strand.assignments.reverse --make-bed --out ${mtdnadir}${mtdnastem}.flipped

##########
# Step 3 #
##########
# Convert to vcf
# Y chromsome #
plink --bfile ${ydir}${ystem}.flipped --recode vcf --output-chr M --out ${ydir}${ystem}.flipped.convert.vcf

# mtDNA #
plink --bfile ${mtdnadir}${mtdnastem}.flipped --recode vcf --output-chr M --out ${mtdnadir}${mtdnastem}.flipped.convert

##########
# Step 4 #
##########
# run haplogroup assignment tools
# Y chromosome #
cd ${yhaprundir}${yhapvcfdir}
cp ${ydir}${ystem}.flipped.convert.vcf.vcf .
cd ../
sh prepare.data.and.run.sh kenyaYflipped/${ystem}.flipped.convert.vcf.vcf yHap_kenya_all_samples
cp yHap_kenya_all_samples/YHap.assignment.yHap_kenya_all_samples.txt ${outydir}

# mtDNA #
cd /scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/scripts
# bgzip vcf
bgzip -c ${mtdnadir}${mtdnastem}.flipped.convert.vcf > ${mtdnadir}${mtdnastem}.flipped.convert.vcf.gz
# 1. run haplogrep. Standard classification metric
cd ${hapgrpdir}
./haplogrep classify --in ${mtdnadir}${mtdnastem}.flipped.convert.vcf.gz --chip --format vcf --out ${outmtdnadir}${mtdnastem}.flipped.haplogroups.chip.txt
# remove sites column because its hard to read file
cut -f1,3,4,5 ${outmtdnadir}${mtdnastem}.flipped.haplogroups.chip.txt > ${outmtdnadir}${mtdnastem}.flipped.haplogroups.chip.short.txt
# 2. run haplogrep. Jaccard index classification metric
./haplogrep classify --in ${mtdnadir}${mtdnastem}.flipped.convert.vcf.gz --chip --metric jaccard --format vcf --out ${outmtdnadir}${mtdnastem}.flipped.haplogroups.chip.jaccard.txt
cut -f1,3,4,5 ${outmtdnadir}${mtdnastem}.flipped.haplogroups.chip.jaccard.txt > ${outmtdnadir}${mtdnastem}.flipped.haplogroups.chip.jaccard.short.txt
# 3. run haplogrep. Hamming Distance classification metric
./haplogrep classify --in ${mtdnadir}${mtdnastem}.flipped.convert.vcf.gz --chip --metric hamming --format vcf --out ${outmtdnadir}${mtdnastem}.flipped.haplogroups.chip.hamming.txt
cut -f1,3,4,5 ${outmtdnadir}${mtdnastem}.flipped.haplogroups.chip.hamming.txt > ${outmtdnadir}${mtdnastem}.flipped.haplogroups.chip.hamming.short.txt
# Combine results
paste ${outmtdnadir}${mtdnastem}.flipped.haplogroups.chip.txt ${outmtdnadir}${mtdnastem}.flipped.haplogroups.chip.jaccard.short.txt ${outmtdnadir}${mtdnastem}.flipped.haplogroups.chip.hamming.short.txt | awk '{ print $1,'\t',$2,'\t',$4,'\t',$6,'\t',$8,'\t',$10,'\t',$12 }' > ${outmtdnadir}${mtdnastem}.flipped.haplogroups.chip.kulczynski.jaccard.hamming.txt

# Deactivate conda environment
source deactivate genetic_diff_kenya
