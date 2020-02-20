#!/bin/bash
#SBATCH --job-name=run.initialQCKenyaPipeline.snakemake # Job name
#SBATCH -o slurm.%j.out                # STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err                # STDERR (%j = JobId)
#SBATCH -n 2
#SBATCH -t 96:00:00
#SBATCH --mail-user=amtarave@asu.edu # send-to address

source activate genetic_diff_kenya
cd /scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/scripts

snakemake -s initialQCKenyaPipeline.snakefile --dag | dot -Tsvg > initialQCKenyaPipeline.svg
snakemake -s initialQCKenyaPipeline.snakefile -j 2 --cluster "sbatch -n 2 -t 48:00:00 --mem-per-cpu=16000 --mail-type=END,FAIL --mail-user=amtarave@asu.edu"

#mv slurm* logs/

source deactivate genetic_diff_kenya
