#!/bin/bash
#SBATCH --job-name=analysis.pipeline # Job name
#SBATCH -o slurm.%j.out                # STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err                # STDERR (%j = JobId)
#SBATCH -n 1
#SBATCH -t 96:00:00
#SBATCH --mail-user=amtarave@asu.edu # send-to address
#source activate genetic_diff_kenya
source activate kenya_fst_pipeline

cd /scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/00_scripts/

snakemake -s analyses.pipeline.snakefile -j 30 --cluster "sbatch -n 1 -t 72:00:00 --mail-type=END,FAIL --mail-user=amtarave@asu.edu"

mv slurm* ../00_logs/

source deactivate genetic_diff_kenya
