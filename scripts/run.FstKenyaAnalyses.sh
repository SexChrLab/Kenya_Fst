#!/bin/bash
#SBATCH --job-name=run.FstKenyaAnalyses.snakefile # Job name
#SBATCH -o slurm.%j.out                # STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err                # STDERR (%j = JobId)
#SBATCH -n 1
#SBATCH -t 96:00:00
#SBATCH --mail-user=amtarave@asu.edu # send-to address

source activate genetic_diff_kenya

cd /scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/scripts

snakemake -s FstKenyaAnalyses.snakefile -j 30 --cluster "sbatch -n 2 -t 12:00:00 --mail-type=END,FAIL --mail-user=amtarave@asu.edu"

mv slurm* logs/

source deactivate genetic_diff_kenya