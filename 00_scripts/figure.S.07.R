#!/usr/bin/Rscript
# Author: Angela Taravella Oill
# ___usage___
# Rscript figure.S.07.R <path_to_fst_results> <average_distance_file> <cultural_FST_linguistic_distance_file> <output_path_and_file_name>

# Description:
# This script will make figure S 7 plot for the manuscript.
# Figure S 7 will be a correlation matrix.


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
# I need to match and merge all the data into 1 data frame. This will make 
# analyses and plotting easier.

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


## Blood Territorial Section ##
# subset genetic df
fst.bts <- genetic.fst[ which(genetic.fst$population_2=="kwatela.blood.ts"
                              | genetic.fst$population_2=="ngibochoros.blood.ts"
                              | genetic.fst$population_2=="ngiyapakuno.blood.ts"), ]
# merge with geo dist
m1 <- merge(fst.bts, geo.dist, by=c("population_1", "population_2"))

# find and replace .blood.clan with nothing
bts.dat.edit <- m1 %>% 
  mutate_all(funs(str_replace(., ".blood.ts", "")))
# merge with other info 
bts.dat <- merge(bts.dat.edit, culture.fst.ling.dist, by=c("population_1", "population_2"))
# Add pop label column for plotting
bts.dat$poplab <- "Blood_Territorial_Section"


## Cultural Territorial Section ##
# subset genetic df
fst.cts <- genetic.fst[ which(genetic.fst$population_2=="kwatela.cultural.ts"
                              | genetic.fst$population_2=="ngibochoros.cultural.ts"
                              | genetic.fst$population_2=="ngiyapakuno.cultural.ts"), ]
# merge with geo dist
m1 <- merge(fst.cts, geo.dist, by=c("population_1", "population_2"))

# find and replace .cultural.ts with nothing
cts.dat.edit <- m1 %>% 
  mutate_all(funs(str_replace(., ".cultural.ts", "")))
# merge with other info 
cts.dat <- merge(cts.dat.edit, culture.fst.ling.dist, by=c("population_1", "population_2"))
# Add pop label column for plotting
cts.dat$poplab <- "Cultural_Territorial_Section"


## Merge all subsets ##
full.data.all <- rbind(eth.dat, bts.dat, cts.dat)
full.data.all.tf <- transform(full.data.all, 
                              Pairwise_genetic_FST = as.numeric(Pairwise_genetic_FST),
                              Genetic_study_geographic_distance = as.numeric(Genetic_study_geographic_distance),
                              Pairwise_cultural_FST = as.numeric(Pairwise_cultural_FST),
                              Linguistic_distance = as.numeric(Linguistic_distance),
                              Cultural_study_geographic_distance = as.numeric(Cultural_study_geographic_distance))


#---------------------------#
## MAKE CORRELATION MATRIX ##
#---------------------------#
# Make correlation data and pvalue data for matricies
cmat <- data.frame()
pmat <- data.frame()

# Ethnic group level
c1 <- cor.test(eth.dat$Pairwise_genetic_FST, eth.dat$Genetic_study_geographic_distance)
c2 <- cor.test(eth.dat$Pairwise_genetic_FST, eth.dat$Pairwise_cultural_FST)
c3 <- cor.test(eth.dat$Pairwise_genetic_FST, eth.dat$Linguistic_distance)
c.all <- cbind(c1$estimate, c2$estimate, c3$estimate)
p.all <- cbind(c1$p.value, c2$p.value, c3$p.value)
cmat <- rbind(cmat, c.all)
pmat <- rbind(pmat, p.all)


# Blood TS level
bts.dat.tf <- transform(bts.dat, 
                        Pairwise_genetic_FST = as.numeric(Pairwise_genetic_FST),
                        Genetic_study_geographic_distance = as.numeric(Genetic_study_geographic_distance),
                        Pairwise_cultural_FST = as.numeric(Pairwise_cultural_FST),
                        Linguistic_distance = as.numeric(Linguistic_distance),
                        Cultural_study_geographic_distance = as.numeric(Cultural_study_geographic_distance))

c1 <- cor.test(bts.dat.tf$Pairwise_genetic_FST, bts.dat.tf$Genetic_study_geographic_distance)
c2 <- cor.test(bts.dat.tf$Pairwise_genetic_FST, bts.dat.tf$Pairwise_cultural_FST)
c3 <- cor.test(bts.dat.tf$Pairwise_genetic_FST, bts.dat.tf$Linguistic_distance)
c.all <- cbind(c1$estimate, c2$estimate, c3$estimate)
p.all <- cbind(c1$p.value, c2$p.value, c3$p.value)
cmat <- rbind(cmat, c.all)
pmat <- rbind(pmat, p.all)

# Cultural TS level
cts.dat.tf <- transform(cts.dat, 
                        Pairwise_genetic_FST = as.numeric(Pairwise_genetic_FST),
                        Genetic_study_geographic_distance = as.numeric(Genetic_study_geographic_distance),
                        Pairwise_cultural_FST = as.numeric(Pairwise_cultural_FST),
                        Linguistic_distance = as.numeric(Linguistic_distance),
                        Cultural_study_geographic_distance = as.numeric(Cultural_study_geographic_distance))

c1 <- cor.test(cts.dat.tf$Pairwise_genetic_FST, cts.dat.tf$Genetic_study_geographic_distance)
c2 <- cor.test(cts.dat.tf$Pairwise_genetic_FST, cts.dat.tf$Pairwise_cultural_FST)
c3 <- cor.test(cts.dat.tf$Pairwise_genetic_FST, cts.dat.tf$Linguistic_distance)
c.all <- cbind(c1$estimate, c2$estimate, c3$estimate)
p.all <- cbind(c1$p.value, c2$p.value, c3$p.value)
cmat <- rbind(cmat, c.all)
pmat <- rbind(pmat, p.all)

# add column and row names
colnames(cmat) <- c("Geographic distance", "Cultural Fst", "Linguistic distance")
rownames(cmat) <- c("Genetic Fst (Ethnolinguistic Groups)", "Genetic Fst (Natal Territorial Sections)",
                    "Genetic Fst (Post-marital Territorial Sections)")


#------#
# PLOT #
#------#
pdf(outname)
corrplot(as.matrix(cmat), method="color",
         tl.col="black", tl.srt=45, na.label = "NA", tl.cex = 0.75,
         p.mat = as.matrix(pmat), sig.level = 0.05, insig = "label_sig")

dev.off()

