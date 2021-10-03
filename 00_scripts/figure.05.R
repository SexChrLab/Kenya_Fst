#!/usr/bin/Rscript
# Author: Angela Taravella Oill
# ___usage___
# Rscript figure.05.R <path_to_fst_results> <average_distance_file> <cultural_FST_linguistic_distance_file> <output_path_and_file_name>

# Description:
# This script will make the main figure 5 plot for the manuscript.
# Figure 5 will have 8 panels, these are pairwise correlation plots.


#--------------------#
### LOAD LIBRARIES ###
#--------------------#
library(ggplot2)
library(RColorBrewer)
library(ggpubr)
library(MASS)
library(ppcor)
library(tidyr)
library(corrplot)
library(tidyverse)  # data manipulation and visualization
library(stringr)
library(dplyr)
library(caret)
library(ggpubr)


#---------------------------#
### SET UP COMMAND INPUTS ###
#---------------------------#
args = commandArgs(trailingOnly=TRUE)
genetic.fst.dat = args[1]
geo.dist.dat = args[2]
culture.fst.ling.dist.dat = args[2]
outname = args[2]


#-------------------------------#
### READ IN DATA FOR PLOTTING ###
#-------------------------------#
genetic.fst <- read.table(genetic.fst.dat, header = F, sep = "\t")
geo.dist <- read.table(geo.dist.dat,  header = F, sep = "\t")
culture.fst.ling.dist <- read.table(culture.fst.ling.dist.dat, header = T, 
                                    sep = "\t")

genetic.fst <- read.table("all.results.Fst.table.txt", header = F, sep = "\t")
geo.dist <- read.table("all.distances.averaged.txt",  header = F, sep = "\t")
culture.fst.ling.dist <- read.table("culturalFst.lingDistance.geoDist.Fix.txt", header = T, sep = "\t")


#------------------------------#
### SUBSET DATA FOR PLOTTING ###
#------------------------------#
# Add column names to data frames
colnames(genetic.fst)<- c("population_1","population_2","Number_sites", "Pairwise_genetic_FST")
colnames(geo.dist)<- c("population_1","population_2","Genetic_study_geographic_distance")


## Ethnolinguistic Group ##
fst.eth <- genetic.fst[ which(genetic.fst$population_1=="borana"
                              | genetic.fst$population_1=="rendille"
                              | genetic.fst$population_1=="samburu"
                              | genetic.fst$population_1=="turkana"), ]
m1 <- merge(fst.eth, geo.dist, by=c("population_1", "population_2"))
eth.dat <- merge(m1, culture.fst.ling.dist, by=c("population_1", "population_2"))
# Add pop label column for plotting
eth.dat$poplab <- "Ethnolinguistic_group"


#----------#
### PLOT ###
#----------#
pdf(outname, width = 14, height = 8)

eth.dat$combo <- paste(eth.dat$population_1, eth.dat$population_2, sep = "-")
a1 <- ggscatter(eth.dat, y = "Pairwise_genetic_FST", x = "Genetic_study_geographic_distance", 
                add = "reg.line", conf.int = TRUE, 
                cor.coef = TRUE, cor.method = "pearson",
                ylab = "Genetic Fst", xlab = "Geographic Distance (km)")
b1 <- ggscatter(eth.dat, y = "Pairwise_cultural_FST", x = "Genetic_study_geographic_distance", 
                add = "reg.line", conf.int = TRUE, 
                cor.coef = TRUE, cor.method = "pearson",
                ylab = "Cultural Fst", xlab = "Geographic Distance (km)")
c <- ggscatter(eth.dat, y = "Pairwise_cultural_FST", x = "Pairwise_genetic_FST", 
               add = "reg.line", conf.int = TRUE, 
               cor.coef = TRUE, cor.method = "pearson",
               ylab = "Cultural Fst", xlab = "Genetic Fst")
d <- ggscatter(eth.dat, y = "Pairwise_genetic_FST", x = "Linguistic_distance", 
               add = "reg.line", conf.int = TRUE, 
               cor.coef = TRUE, cor.method = "pearson",
               ylab = "Genetic Fst", xlab = "Linguistic Distance")
e <- ggscatter(eth.dat, y = "Pairwise_cultural_FST", x = "Linguistic_distance", 
               add = "reg.line", conf.int = TRUE, 
               cor.coef = TRUE, cor.method = "pearson",
               ylab = "Cultural Fst", xlab = "Linguistic Distance")
f1 <- ggscatter(eth.dat, y = "Genetic_study_geographic_distance", x = "Linguistic_distance", 
                add = "reg.line", conf.int = TRUE, 
                cor.coef = TRUE, cor.method = "pearson",
                ylab = "Geographic Distance (km)", xlab = "Linguistic Distance")

ggarrange(a1, b1, c, d, e, f1, 
          labels = c("A", "B", "C",
                     "D", "E", "F"),
          ncol = 3, nrow = 2)
dev.off()
