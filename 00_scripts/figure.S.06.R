#!/usr/bin/Rscript
# Author: Angela Taravella Oill
# ___usage___
# Rscript figure.S.06.R <path_to_fastas> <output_path_and_file_name>

# Description:
# This script will make the figure S 6 plot for the manuscript.
# Figure S 6 will have 4 panels, each mtDNA chromosome haplotype networks for 
# each ethnic group.


#--------------------#
### LOAD LIBRARIES ###
#--------------------#
library(ape)
library(pegas)


#---------------------------#
### SET UP COMMAND INPUTS ###
#---------------------------#
args = commandArgs(trailingOnly=TRUE)
datpth = args[1]
outname = args[2]


#-------------------------------#
### READ IN DATA FOR PLOTTING ###
#-------------------------------#
# Set up variabel names for each fasta file to plot
turkana_dat <- paste(datpth, "turkana.chrM.clan.fasta", sep = "")
samburu_dat <- paste(datpth, "samburu.chrM.clan.fasta", sep = "")
rendille_dat <- paste(datpth, "rendille.chrM.clan.fasta", sep = "")
borana_dat <- paste(datpth, "borana.chrM.clan.fasta", sep = "")


#----------#
### PLOT ###
#----------#
pdf(outname)

par(mfrow=c(2,2))

###########
# Turkana #
###########
read.dna(turkana_dat, format="fasta") -> Naso
NasoHaps <- haplotype(Naso)
NasoNet <- haploNet(NasoHaps)

ind.hap<-with(
  stack(setNames(attr(NasoHaps, "index"), rownames(NasoHaps))),
  table(hap=ind, individuals=rownames(Naso)[values])
)

plot(NasoNet, size=attr(NasoNet, "freq"), scale.ratio = .5, cex = 1, pie=ind.hap,
     legend=F, label=F, show.mutation = 4, main = "Turkana")
legend(-22,-13, colnames(ind.hap), col=rainbow(ncol(ind.hap)), pch=19, ncol=2, cex = .75)

###########
# Samburu #
###########
read.dna(samburu_dat, format="fasta") -> Naso
NasoHaps <- haplotype(Naso)
NasoNet <- haploNet(NasoHaps)

ind.hap<-with(
  stack(setNames(attr(NasoHaps, "index"), rownames(NasoHaps))),
  table(hap=ind, individuals=rownames(Naso)[values])
)

plot(NasoNet, size=attr(NasoNet, "freq"), scale.ratio = .5, cex = 1, pie=ind.hap,
     legend=F, label=F, show.mutation = 4, main = "Samburu")
legend(-14,-22, colnames(ind.hap), col=rainbow(ncol(ind.hap)), pch=19, ncol=2, cex = .75)

############
# Rendille #
############
read.dna(rendille_dat, format="fasta") -> Naso
NasoHaps <- haplotype(Naso)
NasoNet <- haploNet(NasoHaps)

ind.hap<-with(
  stack(setNames(attr(NasoHaps, "index"), rownames(NasoHaps))),
  table(hap=ind, individuals=rownames(Naso)[values])
)

plot(NasoNet, size=attr(NasoNet, "freq"), scale.ratio = .5, cex = 1, pie=ind.hap,
     legend=F, label=F, show.mutation = 4, main = "Rendille")
legend(-13,-10, colnames(ind.hap), col=rainbow(ncol(ind.hap)), pch=19, ncol=2, cex = .75)

##########
# Borana #
##########
read.dna(borana_dat, format="fasta") -> Naso
NasoHaps <- haplotype(Naso)
NasoNet <- haploNet(NasoHaps)

ind.hap<-with(
  stack(setNames(attr(NasoHaps, "index"), rownames(NasoHaps))),
  table(hap=ind, individuals=rownames(Naso)[values])
)

plot(NasoNet, size=attr(NasoNet, "freq"), scale.ratio = .5, cex = 1, pie=ind.hap,
     legend=F, label=F, show.mutation = 4, main = "Borana")
legend(-13,-20, colnames(ind.hap), col=rainbow(ncol(ind.hap)), pch=19, ncol=2, cex = .75)


dev.off()


