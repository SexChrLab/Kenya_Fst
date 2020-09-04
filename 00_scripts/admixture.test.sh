#!/bin/bash
#SBATCH --job-name=run.admixture.test # Job name
#SBATCH -o slurm.%j.out                # STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err                # STDERR (%j = JobId)
#SBATCH -n 1
#SBATCH -t 96:00:00
#SBATCH --mail-user=amtarave@asu.edu # send-to address

source activate kenya_fst_pipeline

cd /scratch/amtarave/Kenya_Fst/00_scripts

snakemake -s admixture.test.snakefile -j 20 --cluster "sbatch -n 1 -t 48:00:00 --mail-type=END,FAIL --mail-user=amtarave@asu.edu"

mv slurm* logs/

source deactivate kenya_fst_pipeline
