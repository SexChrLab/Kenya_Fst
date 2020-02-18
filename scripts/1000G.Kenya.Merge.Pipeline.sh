#!/bin/bash
#SBATCH -n 2
#SBATCH --job-name=1000G.Kenya.Merge.Pipeline
#SBATCH -t 2-0:0
#SBATCH -o slurm.1000G.Kenya.Merge.Pipeline.out
#SBATCH -e slurm.1000G.Kenya.Merge.Pipeline.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=amtarave@asu.edu
date
# Activate appropriate conda environment
source activate genetic_diff_kenya

#############
# VARIABLES #
#############
# Directory to Kenya cleaned plink file for autosomes
kenyadirauto="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/01_filtering/autos/"
# Stem file name for autosomal Kenya plink file (map ped files)
kenyastemauto="autosomes.snp.array.noRelateds.geno0.05.hwe1e-50.LD-50-10-0.2.outliersRm.NEW.2.plinkConvert"
# Directory to Kenya cleaned plink file for x chromosome
kenyadirxchr="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/01_filtering/xChr/"
# Stem file name for x chromosome Kenya plink file
kenyastemxchr="xChr.snp.array.noRelateds.setMaleHetsMissing.geno0.05.hwe1e-50.LD-50-10-0.2.outliersRm.NEW.2.plinkConvert"
# Output directory base. There will be sub directories
outdirlist="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/02_analyses/04_1000G_Kenya/lists/"
# 1000 genomes vcf directory
vcfdir="/mnt/storage/SAYRES/1000genomes/ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/"
# 1000 genomes autosome prfix and suffix file names
vcfautoprx="ALL.chr"
vcfautosfx=".phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes"
# 1000 genomes X chromosome file name
vcfxchr="ALL.chrX.phase3_shapeit2_mvncall_integrated_v1b.20130502.genotypes"
# Related samples file
relatedsmpls="20140625_related_individuals.txt"
# 1000 genomes processed output
outdirprocessed="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/02_analyses/04_1000G_Kenya/processed_files/1000genomes/"
# 1000 genomes merge list
automergelist="merge.list.txt"
# Kenya array processed files
kdirprocessed="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/02_analyses/04_1000G_Kenya/processed_files/kenya_array/"
# GRCH37 ref genome
grch37="/mnt/storage/SAYRES/REFERENCE_GENOMES/Homo_sapiens_assembly19/Homo_sapiens_assembly19.fasta"
# Merged file directory
mergedir="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/02_analyses/04_1000G_Kenya/processed_files/merged/"
# Merged file stem name
mergestm="MERGED.Kenya.Array.1000G.MAF0.1"
# LD prune parameters
LDPRN1="50" # SNP window size
LDPRN2="10" # SNP step size for sliding window
LDPRN3="0.2" # removal each SNP that has an R2 value of greater than this value
# Sample list of the Kenya array samples and 1000 genomes African samples
KEEPFIL="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/02_analyses/04_1000G_Kenya/lists/AfricanPops.noAdmix.KenyaArray.txt"
# Directory to PCA pars and outs
pcadirautoall="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/02_analyses/04_1000G_Kenya/pca/autos_all/"
pcadirautoafr="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/02_analyses/04_1000G_Kenya/pca/autos_afrpops/"
pcadirxchrall="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/02_analyses/04_1000G_Kenya/pca/xchr_all/"
pcadirxchrafr="/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/02_analyses/04_1000G_Kenya/pca/xchr_afrpops/"

#-------------------------------------------------------------------------------
########
# CODE #
########

##########
# Step 1 #
##########
# Get position lists for each chromosome for the Kenya plink file
# Autosomes
for i in {1..22}
do
  awk '{ if($1 == '${i}') {print $1,"\t",$4} }' ${kenyadirauto}${kenyastemauto}.map > ${outdirlist}${kenyastemauto}.chr${i}.pos.txt
done
# X chromosome
awk '{ if($1 == 23) {print "X","\t",$4} }' ${kenyadirxchr}${kenyastemxchr}.map > ${outdirlist}${kenyastemxchr}.chrX.pos.txt

##########
# Step 2 #
##########
# Prepare 1000 genomes vcf
# 2.a Convert 1000 genomes vcfs to plink with biallelic sites only
# 2.b Extract positions from step 1 from the 1000 genomes VCFs
# 2.c Merge all the autosomes together into one plink file
# 2.d Minor allele frequency filter

# get sample list of related 1000 genomes indivuals
#cut -f1 ${vcfdir}${relatedsmpls} | grep -v Sample > ${outdirlist}related_samples_1000genomes.txt
cut -f2 -d':' ${vcfdir}${relatedsmpls} | grep -v Sample | sed 's/\,/\n/g' > ${outdirlist}related_samples_1000genomes.txt

# Autosomes #
rm ${outdirprocessed}${automergelist}
touch ${outdirprocessed}${automergelist}
for i in {1..22}
do
  vcftools --gzvcf ${vcfdir}${vcfautoprx}${i}${vcfautosfx}.vcf.gz --positions ${outdirlist}${kenyastemauto}.chr${i}.pos.txt --remove ${outdirlist}related_samples_1000genomes.txt --recode --stdout | bgzip -c > ${outdirprocessed}${vcfautoprx}${i}${vcfautosfx}.arraySites.vcf.gz
  zcat ${outdirprocessed}${vcfautoprx}${i}${vcfautosfx}.arraySites.vcf.gz | grep -v '^#' | cut -f 3 | sort | uniq -d> ${outdirprocessed}${vcfautoprx}${i}${vcfautosfx}.arraySites.dups
  plink --vcf ${outdirprocessed}${vcfautoprx}${i}${vcfautosfx}.arraySites.vcf.gz --biallelic-only strict --exclude ${outdirprocessed}${vcfautoprx}${i}${vcfautosfx}.arraySites.dups --make-bed --out ${outdirprocessed}${vcfautoprx}${i}${vcfautosfx}.arraySites.biallelic
  echo "${outdirprocessed}${vcfautoprx}${i}${vcfautosfx}.arraySites.biallelic" >> ${outdirprocessed}${automergelist}
done
# Merge autosomes
plink --bfile ${outdirprocessed}${vcfautoprx}1${vcfautosfx}.arraySites.biallelic --merge-list ${outdirprocessed}${automergelist} --make-bed --out ${outdirprocessed}${vcfautoprx}${vcfautosfx}.arraySites.biallelic.merged

# MAF filter
plink --bfile ${outdirprocessed}${vcfautoprx}${vcfautosfx}.arraySites.biallelic.merged --maf 0.1 --make-bed --out ${outdirprocessed}${vcfautoprx}${vcfautosfx}.arraySites.biallelic.merged.MAF0.1

# X chromosome #
# Extract positions from step 1 from the 1000 genomes VCFs
vcftools --gzvcf ${vcfdir}${vcfxchr}.vcf.gz --positions ${outdirlist}${kenyastemxchr}.chrX.pos.txt --recode --stdout | bgzip -c > ${outdirprocessed}${vcfxchr}.arraySites.vcf.gz
zcat ${outdirprocessed}${vcfxchr}.arraySites.vcf.gz | grep -v '^#' | cut -f 3 | sort | uniq -d> ${outdirprocessed}${vcfxchr}.arraySites.dups
plink --vcf ${outdirprocessed}${vcfxchr}.arraySites.vcf.gz --exclude ${outdirprocessed}${vcfxchr}.arraySites.dups --biallelic-only strict --make-bed --out ${outdirprocessed}${vcfxchr}.arraySites.biallelic
# maf filter
plink --bfile ${outdirprocessed}${vcfxchr}.arraySites.biallelic --maf 0.1 --make-bed --out ${outdirprocessed}${vcfxchr}.arraySites.biallelic.MAF0.1

##########
# Step 3 #
##########
# Prepare Kenya file
# 3. a Flip snps - Kenya array.
# 3. b Minor allele filter (10%)

# Autosomes #
# Make plink file binary
plink --file ${kenyadirauto}${kenyastemauto} --make-bed --out ${kenyadirauto}${kenyastemauto}.binary
# Create list of forward, reverse, and ambiguous strand SNPs
snpflip --fasta-genome=${grch37} --bim-file=${kenyadirauto}${kenyastemauto}.binary.bim --output-prefix=${kdirprocessed}${kenyastemauto}.strand.assignments
# Flip reverse strand SNPs and generate new plink files
plink --bfile ${kenyadirauto}${kenyastemauto}.binary --flip ${kdirprocessed}${kenyastemauto}.strand.assignments.reverse --make-bed --out ${kdirprocessed}${kenyastemauto}.flipped
# MAF filter
plink --bfile ${kdirprocessed}${kenyastemauto}.flipped --maf 0.1 --make-bed --out ${kdirprocessed}${kenyastemauto}.flipped.MAF0.1

# X chromosome #
# Make plink file binary
plink --file ${kenyadirxchr}${kenyastemxchr} --output-chr M --make-bed --out ${kenyadirxchr}${kenyastemxchr}.binary
# Create list of forward, reverse, and ambiguous strand SNPs
snpflip --fasta-genome=${grch37} --bim-file=${kenyadirxchr}${kenyastemxchr}.binary.bim --output-prefix=${kdirprocessed}${kenyastemxchr}.strand.assignments
# Flip reverse strand SNPs and generate new plink files
plink --bfile ${kenyadirxchr}${kenyastemxchr}.binary --output-chr M --flip ${kdirprocessed}${kenyastemxchr}.strand.assignments.reverse --make-bed --out ${kdirprocessed}${kenyastemxchr}.flipped
# MAF filter
plink --bfile ${kdirprocessed}${kenyastemxchr}.flipped --maf 0.1 --output-chr M --make-bed --out ${kdirprocessed}${kenyastemxchr}.flipped.MAF0.1

##########
# Step 4 #
##########
# Fix id cols in both 1000 genomes and kenya array plink files
# plink 2 can do this
source deactivate genetic_diff_kenya
module load plink/2.0.0
# 1000 genomes autosomes
plink2 --bfile ${outdirprocessed}${vcfautoprx}${vcfautosfx}.arraySites.biallelic.merged.MAF0.1 --set-all-var-ids @:# --make-bed --out ${outdirprocessed}${vcfautoprx}${vcfautosfx}.arraySites.biallelic.merged.MAF0.1.fixIDs
# 1000 genomes x chromosome
plink2 --bfile ${outdirprocessed}${vcfxchr}.arraySites.biallelic.MAF0.1 --set-all-var-ids @:# --make-bed --out ${outdirprocessed}${vcfxchr}.arraySites.biallelic.MAF0.1.fixIDs
# Kenya array autosomes
plink2 --bfile ${kdirprocessed}${kenyastemauto}.flipped.MAF0.1 --set-all-var-ids @:# --make-bed --out ${kdirprocessed}${kenyastemauto}.flipped.MAF0.1.fixIDs
# Kenya array x chromosome
plink2 --bfile ${kdirprocessed}${kenyastemxchr}.flipped.MAF0.1 --set-all-var-ids @:# --make-bed --out ${kdirprocessed}${kenyastemxchr}.flipped.MAF0.1.fixIDs
module unload plink/2.0.0
source activate genetic_diff_kenya

##########
# Step 5 #
##########
# Merge data
# Merge pass 1
# Autosomes #
plink --bfile ${kdirprocessed}${kenyastemauto}.flipped.MAF0.1.fixIDs --bmerge ${outdirprocessed}${vcfautoprx}${vcfautosfx}.arraySites.biallelic.merged.MAF0.1.fixIDs --recode --out ${mergedir}${mergestm}.autos
# X chromosome #
plink --bfile ${kdirprocessed}${kenyastemxchr}.flipped.MAF0.1.fixIDs --bmerge ${outdirprocessed}${vcfxchr}.arraySites.biallelic.MAF0.1.fixIDs --recode --out ${mergedir}${mergestm}.Xchr

# Remove ambigous snps (.missnp)
plink --bfile ${kdirprocessed}${kenyastemauto}.flipped.MAF0.1.fixIDs --exclude ${mergedir}${mergestm}.autos.missnp --make-bed --out ${kdirprocessed}${kenyastemauto}.flipped.MAF0.1.fixIDs.RMmissnp
plink --bfile ${outdirprocessed}${vcfautoprx}${vcfautosfx}.arraySites.biallelic.merged.MAF0.1.fixIDs --exclude ${mergedir}${mergestm}.autos.missnp --make-bed --out ${outdirprocessed}${vcfautoprx}${vcfautosfx}.arraySites.biallelic.merged.MAF0.1.fixIDs.RMmissnp
plink --bfile ${kdirprocessed}${kenyastemxchr}.flipped.MAF0.1.fixIDs --exclude ${mergedir}${mergestm}.Xchr.missnp --make-bed --out ${kdirprocessed}${kenyastemxchr}.flipped.MAF0.1.fixIDs.RMmissnp
plink --bfile ${outdirprocessed}${vcfxchr}.arraySites.biallelic.MAF0.1.fixIDs --exclude ${mergedir}${mergestm}.Xchr.missnp --make-bed --out ${outdirprocessed}${vcfxchr}.arraySites.biallelic.MAF0.1.fixIDs.RMmissnp

# Merge pass 2
# Autosomes #
plink --bfile ${kdirprocessed}${kenyastemauto}.flipped.MAF0.1.fixIDs.RMmissnp --bmerge ${outdirprocessed}${vcfautoprx}${vcfautosfx}.arraySites.biallelic.merged.MAF0.1.fixIDs.RMmissnp --recode --out ${mergedir}${mergestm}.autos.pass2
# X chromosome #
plink --bfile ${kdirprocessed}${kenyastemxchr}.flipped.MAF0.1.fixIDs.RMmissnp --bmerge ${outdirprocessed}${vcfxchr}.arraySites.biallelic.MAF0.1.fixIDs.RMmissnp --recode --out ${mergedir}${mergestm}.Xchr.pass2

##########
# Step 6 #
##########
# Site filters and LD prune
# Call rate 95% filter
# Autosomes #
plink --bfile ${mergedir}${mergestm}.autos.pass2 --geno 0.05 --make-bed --out ${mergedir}${mergestm}.autos.pass2.geno0.05
# X chromsome #
plink --bfile ${mergedir}${mergestm}.Xchr.pass2 --geno 0.05 --make-bed --out ${mergedir}${mergestm}.Xchr.pass2.geno0.05

# LD prune
# Autosomes #
plink --bfile ${mergedir}${mergestm}.autos.pass2.geno0.05 --indep-pairwise ${LDPRN1} ${LDPRN2} ${LDPRN3} --out ${mergedir}${mergestm}.autos.pass2.geno0.05.LDprune${LDPRN1}-${LDPRN2}-${LDPRN3}
plink --bfile ${mergedir}${mergestm}.autos.pass2.geno0.05 --exclude ${mergedir}${mergestm}.autos.pass2.geno0.05.LDprune${LDPRN1}-${LDPRN2}-${LDPRN3}.prune.out --make-bed --out ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}
# X chromsome #
plink --bfile ${mergedir}${mergestm}.Xchr.pass2.geno0.05 --indep-pairwise ${LDPRN1} ${LDPRN2} ${LDPRN3} --out ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDprune${LDPRN1}-${LDPRN2}-${LDPRN3}
plink --bfile ${mergedir}${mergestm}.Xchr.pass2.geno0.05 --exclude ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDprune${LDPRN1}-${LDPRN2}-${LDPRN3}.prune.out --make-bed --out ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}

##########
# Step 7 #
##########
# Get African populations only. I want to do a PCA with just the African populations
# Autosomes #
plink --bfile ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3} --keep ${KEEPFIL} --make-bed --out ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops
# X chromsome #
plink --bfile ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3} --keep ${KEEPFIL} --make-bed --out ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops

#-------------------------------------------------------------------------------
# PCA #
##########
# Step 8 #
##########
# PCA
# Convert to map/ped
# Autosomes #
# All
plink --bfile ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3} --recode --out ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.convert
# African pops
plink --bfile ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops --recode --out ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.convert
# X chromsome #
# All
plink --bfile ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3} --recode --out ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.convert
# African pops
plink --bfile ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops --recode --out ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.convert

##########
# Step 9 #
##########
# Fix ped
awk '{{$6 = "1"; print}}' ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.convert.ped > ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.convert.fix.ped
awk '{{$6 = "1"; print}}' ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.convert.ped > ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.convert.fix.ped
awk '{{$6 = "1"; print}}' ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.convert.ped > ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.convert.fix.ped
awk '{{$6 = "1"; print}}' ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.convert.ped > ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.convert.fix.ped

###########
# Step 10 #
###########
# Make par files
# All autosomes #
rm ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
touch ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
# Add content to par file
echo "genotypename: ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.convert.fix.ped" > ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "snpname: ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.convert.map" >> ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "indivname: ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.convert.fix.ped" >> ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "evecoutname: ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.evec" >> ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "evaloutname: ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.eval" >> ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "altnormstyle: NO" >> ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "familynames: NO" >> ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "noxdata: NO" >> ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "numoutlieriter: 0" >> ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par

# Afr Autosomes #
rm ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
touch ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
# Add content to par file
echo "genotypename: ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.convert.fix.ped" > ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "snpname: ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.convert.map" >> ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "indivname: ${mergedir}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.convert.fix.ped" >> ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "evecoutname: ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.evec" >> ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "evaloutname: ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.eval" >> ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "altnormstyle: NO" >> ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "familynames: NO" >> ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "noxdata: NO" >> ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "numoutlieriter: 0" >> ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par

# All X chromsome #
rm ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
touch ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
# Add content to par file
echo "genotypename: ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.convert.fix.ped" > ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "snpname: ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.convert.map" >> ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "indivname: ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.convert.fix.ped" >> ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "evecoutname: ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.evec" >> ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "evaloutname: ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.eval" >> ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "altnormstyle: NO" >> ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "familynames: NO" >> ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "numchrom: 23" >> ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "chrom: 23" >> ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "noxdata: NO" >> ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par
echo "numoutlieriter: 0" >> ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par

# Afr X chromsome #
rm ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
touch ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
# Add content to par file
echo "genotypename: ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.convert.fix.ped" > ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "snpname: ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.convert.map" >> ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "indivname: ${mergedir}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.convert.fix.ped" >> ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "evecoutname: ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.evec" >> ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "evaloutname: ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.eval" >> ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "altnormstyle: NO" >> ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "familynames: NO" >> ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "numchrom: 23" >> ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "chrom: 23" >> ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "noxdata: NO" >> ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par
echo "numoutlieriter: 0" >> ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par

###########
# Step 10 #
###########
# Run smartpca
# All autosomes #
smartpca -p ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par

# Afr Autosomes #
smartpca -p ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par

# All X chromsome #
smartpca -p ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.par

# Afr X chromsome #
smartpca -p ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.par

###########
# Step 11 #
###########
# Fix evec output for plotting
awk '{{if($1 == "\t" ) {{print $2,"\t",$3,"\t",$4,"\t",$5,"\t",$6,"\t",$7,"\t",$8,"\t",$9,"\t",$10,"\t",$11,"\t",$12,"\t",$13,"\t"}} else {{print $1,"\t",$2,"\t",$3,"\t",$4,"\t",$5,"\t",$6,"\t",$7,"\t",$8,"\t",$9,"\t",$10,"\t",$11,"\t",$12,"\t"}}}}' ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.evec > ${pcadirautoall}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.FIX.evec
awk '{{if($1 == "\t" ) {{print $2,"\t",$3,"\t",$4,"\t",$5,"\t",$6,"\t",$7,"\t",$8,"\t",$9,"\t",$10,"\t",$11,"\t",$12,"\t",$13,"\t"}} else {{print $1,"\t",$2,"\t",$3,"\t",$4,"\t",$5,"\t",$6,"\t",$7,"\t",$8,"\t",$9,"\t",$10,"\t",$11,"\t",$12,"\t"}}}}' ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.evec > ${pcadirautoafr}${mergestm}.autos.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.FIX.evec
awk '{{if($1 == "\t" ) {{print $2,"\t",$3,"\t",$4,"\t",$5,"\t",$6,"\t",$7,"\t",$8,"\t",$9,"\t",$10,"\t",$11,"\t",$12,"\t",$13,"\t"}} else {{print $1,"\t",$2,"\t",$3,"\t",$4,"\t",$5,"\t",$6,"\t",$7,"\t",$8,"\t",$9,"\t",$10,"\t",$11,"\t",$12,"\t"}}}}' ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.evec > ${pcadirxchrall}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.FIX.evec
awk '{{if($1 == "\t" ) {{print $2,"\t",$3,"\t",$4,"\t",$5,"\t",$6,"\t",$7,"\t",$8,"\t",$9,"\t",$10,"\t",$11,"\t",$12,"\t",$13,"\t"}} else {{print $1,"\t",$2,"\t",$3,"\t",$4,"\t",$5,"\t",$6,"\t",$7,"\t",$8,"\t",$9,"\t",$10,"\t",$11,"\t",$12,"\t"}}}}' ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.evec > ${pcadirxchrafr}${mergestm}.Xchr.pass2.geno0.05.LDpruned-${LDPRN1}-${LDPRN2}-${LDPRN3}.AFRpops.FIX.evec

###########
# Step 12 #
###########
# TO DO
# Add plotting R script here

source deactivate genetic_diff_kenya
