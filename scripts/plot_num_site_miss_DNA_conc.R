#!/usr/bin/Rscript
# Author: Angela Taravella
# ___usage___
# Rscript plot_num_site_miss_DNA_conc.R dna-concentrations.txt your.imiss.tab.txt your.lmiss.tab.txt your.out.stem.name

# Description:
# Plots missing data info


### SET UP COMMAND INPUTS ###
args = commandArgs(trailingOnly=TRUE)
inDNACon = args[1]
inimiss = args[2]
inlmiss = args[3]
outstem = args[4]

# Read in data that will be used for plotting
in_data_1 <- read.table(inDNACon, sep = '\t', header = T)
in_data_2 <- read.table(inimiss,
                        sep = '\t', header = T)
in_data_3 <- read.table(inlmiss,
                        sep = '\t', header = T)

merge_1_2 <- merge(in_data_1, in_data_2, by.x = "IID")

# Plot 1: Frequency of missing data per individual vs DNA yeild
# paste
pdf(paste(outstem, ".F_miss_VS_DNA.pdf", sep = ""))
plot(y = merge_1_2$F_MISS, x = merge_1_2$DNA_Concentration,
     xlab = "Total yield post QC (ng)", ylab = "Frequency sites missing",
     main = "Frequency of missing data per individual vs DNA yeild")
dev.off()

# Plot 2: Number of missing sites per individual vs DNA yeild
pdf(paste(outstem, ".N_miss_VS_DNA.pdf", sep = ""))
plot(y = merge_1_2$N_MISS, x = merge_1_2$DNA_Concentration,
     xlab = "Total yield post QC (ng)", ylab = "Number sites missing",
     main = "Number of missing sites per individual vs DNA yeild")
dev.off()

# Plot 3: Frequency of missing data
pdf(paste(outstem, ".F_missing_per_site.pdf", sep = ""))
hist(in_data_3$F_MISS, ylim = c(0,1800000),
     xlab = "Frequency missing",
     ylab = "Number of sites",
     main = "Frequency of missing data per site")
dev.off()
summary(in_data_2$F_MISS)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's
#  0.000   0.000   0.003   0.011   0.010   1.000    3541


####
# Plot 4: Frequency of missing data
pdf(paste(outstem, ".F_missing_per_ind.pdf", sep = ""))
hist(in_data_2$F_MISS, xlim = c(0,0.15),
     xlab = "Frequency missing",
     ylab = "Number of individuals",
     main = "Frequency of missing data per individual")
dev.off()
#setsummary(in_data_2$F_MISS)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's
#  0.000   0.000   0.003   0.011   0.010   1.000    3541
