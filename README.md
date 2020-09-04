# Kenya_Fst

## Project Overview
This repository contains scripts for the Kenya genetic differentiation project.

## Analysis pipeline
A snakefile has been created that has all the quality control and analysis steps. `analyses.pipeline.snakefile` can be found in the `scripts/` folder. There is also an accompanying json file called `analyses.pipeline.json`. Sample lists are called in this snakefile and can be found in the `00_lists/` folder, scripts can be found in `00_scripts`.

## Making sample lists for Fst analysis
For the Fst analysis, I need to make liksts of individuals to include in each population for the Fst calculations. For this I will use command line scripting to generate these lists. The lists will be 1 sample per line with format FID_IID.

```
cd /scratch/amtarave/Kenya_Fst/00_lists/sample_info/
# ethnolinguistic groups
grep ",TURKANA," kenya.snp.array.metadata.csv | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/turkana
grep ",SAMBURU," kenya.snp.array.metadata.csv | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/samburu
grep ",RENDILLE," kenya.snp.array.metadata.csv | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/rendille
grep ",BORANA," kenya.snp.array.metadata.csv | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/borana

# blood clans
# borana
cut -f1,2,8 -d',' kenya.snp.array.metadata.csv | grep -w "NOONITUU" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/noonituu.blood.clan
cut -f1,2,8 -d',' kenya.snp.array.metadata.csv | grep -w "WARRAJIDAA" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/warrajidaa.blood.clan
# rendille
cut -f1,2,8 -d',' kenya.snp.array.metadata.csv | grep -w "LDUPSAI" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/ldupsai.blood.clan
cut -f1,2,8 -d',' kenya.snp.array.metadata.csv | grep -w "SAALE" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/saale.blood.clan
# samburu
cut -f1,2,8 -d',' kenya.snp.array.metadata.csv | grep -w "LPISIKISHU" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/lpisikishu.blood.clan
cut -f1,2,8 -d',' kenya.snp.array.metadata.csv | grep -w "LUKUMAI" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/lukumai.blood.clan
# turkana
cut -f1,2,8 -d',' kenya.snp.array.metadata.csv | grep -w "NGIDOCA" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/ngidoca.blood.clan
cut -f1,2,8 -d',' kenya.snp.array.metadata.csv | grep -w "NGISIGER" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/ngisiger.blood.clan
cut -f1,2,8 -d',' kenya.snp.array.metadata.csv | grep -w "NGIPONGAA" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/ngipongaa.blood.clan

# cultural clans
# borana
cut -f1,2,9 -d',' kenya.snp.array.metadata.csv | grep -w "NOONITUU" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/noonituu.cultural.clan
cut -f1,2,9 -d',' kenya.snp.array.metadata.csv | grep -w "WARRAJIDAA" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/warrajidaa.cultural.clan
# rendille
cut -f1,2,9 -d',' kenya.snp.array.metadata.csv | grep -w "LDUPSAI" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/ldupsai.cultural.clan
cut -f1,2,9 -d',' kenya.snp.array.metadata.csv | grep -w "SAALE" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/saale.cultural.clan
# samburu
cut -f1,2,9 -d',' kenya.snp.array.metadata.csv | grep -w "LPISIKISHU" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/lpisikishu.cultural.clan
cut -f1,2,9 -d',' kenya.snp.array.metadata.csv | grep -w "LUKUMAI" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/lukumai.cultural.clan
# turkana
cut -f1,2,9 -d',' kenya.snp.array.metadata.csv | grep -w "NGIDOCA" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/ngidoca.cultural.clan
cut -f1,2,9 -d',' kenya.snp.array.metadata.csv | grep -w "NGISIGER" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/ngisiger.cultural.clan
cut -f1,2,9 -d',' kenya.snp.array.metadata.csv | grep -w "NGIPONGAA" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/ngipongaa.cultural.clan

# blood territorial section
cut -f1,2,10 -d',' kenya.snp.array.metadata.csv | grep -w "KWATELA" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/kwatela.blood.ts
cut -f1,2,10 -d',' kenya.snp.array.metadata.csv | grep -w "NGIBOCHOROS" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/ngibochoros.blood.ts
cut -f1,2,10 -d',' kenya.snp.array.metadata.csv | grep -w "NGIYAPAKUNO" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/ngiyapakuno.blood.ts

# cultural territorial sections
cut -f1,2,11 -d',' kenya.snp.array.metadata.csv | grep -w "KWATELA" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/kwatela.cultural.ts
cut -f1,2,11 -d',' kenya.snp.array.metadata.csv | grep -w "NGIBOCHOROS" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/ngibochoros.cultural.ts
cut -f1,2,11 -d',' kenya.snp.array.metadata.csv | grep -w "NGIYAPAKUNO" | awk -F',' '{print $1,"_",$2}' | sed 's/ //g' > ../fst_lists/ngiyapakuno.cultural.ts
```

## Environment Issue, solved
Originally I was using an environment called genetic_diff_kenya but I seem to be having an issue with executing R scripts.

Make a new environment for scripting called `kenya_fst_pipeline`

```
conda create --name kenya_fst_pipeline

Collecting package metadata (current_repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: /home/amtarave/miniconda3/envs/kenya_fst_pipeline



Proceed ([y]/n)? y

Preparing transaction: done
Verifying transaction: done
Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate kenya_fst_pipeline
#
# To deactivate an active environment, use
#
#     $ conda deactivate

```

Install appropriate packages for running R plotting scripts

```
# First install sf
conda install -c conda-forge/label/cf201901 r-sf

# Install others
conda install -c conda-forge r-ggplot2
conda install -c conda-forge r-tidyr
conda install -c conda-forge r-ggpubr
conda install -c conda-forge r-rnaturalearth
conda install -c conda-forge r-rnaturalearthdata
conda install -c conda-forge r-rgeos

conda install -c bioconda snakemake-minimal
conda install -c conda-forge admixture
conda install -c conda-forge plink
```
