#!/usr/bin/Rscript
# Author: Angela Taravella
# ___usage___
# rscript plotFvsYcounts.R yCountFile.tab.txt yCountFilePlotName.pdf

# Description:
# Plots distribution of y count and inbreeding coeficient results from plink.


### SET UP COMMAND INPUTS ###
args = commandArgs(trailingOnly=TRUE)
sexcheckfile = args[1]
plotname = args[2]


### PLOT RESULTS ###
# Read in data
sexcheckresults <- read.table(sexcheckfile, 
                              sep = '\t',
                              header = T)

# Plot and save
pdf(plotname, 8,8)
plot(x = sexcheckresults$F, y = sexcheckresults$YCOUNT, 
     ylab = "Genotype calls on Y chromosome",
     xlab = "X chromosome inbreeding coefficient (F)")
dev.off()