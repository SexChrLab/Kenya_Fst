# Angela Oill
# Plot distribution of permuted Fst values
# USAGE: Rscript plotPermutationDistribution.R </fst/dir/> <fst.file.name.stem> <sex> <observed Fst value> </out/dir/> 

# Load libraries
library(ggplot2)


# Command Line Variables #
args = commandArgs(trailingOnly=TRUE)
dat.dir = args[1] # this will be the directory to the input file with the / at the end
dat.fn = args[2] # this will be the stem file name of the input file (without .txt)
sex = args[3] # sex analyzed 
obs.fst = args[4] # observed Fst value
out.dir = args[5] # directory to output file


# Read in data #
dat.dir.fn <- paste(dat.dir, dat.fn, ".txt", sep = "")
dat.tb <- read.table(dat.dir.fn)


# Plot #
# Histogram
out.fn <- paste(dat.fn, ".pdf", sep = "")
pdf(paste(out.dir, out.fn, sep = ""))
ggplot(dat.tb, aes(x=V4)) + 
  geom_histogram(colour="black", fill="grey") +
  geom_vline(xintercept = as.numeric(obs.fst), color = "red") +
  ggtitle(paste("Fst (", as.character(sex), ")", sep = "")) +
  xlab("Fst (autosomes)") +
  theme_light() +
  theme(plot.title = element_text(hjust = 0.5)) #+

# With density curve
ggplot(dat.tb, aes(x=V4)) + 
  geom_histogram(colour="black", fill="grey", aes(y=..density..)) +
  geom_vline(xintercept = as.numeric(obs.fst), color = "red") +
  ggtitle(paste("Fst (", as.character(sex), ")", sep = "")) +
  xlab("Fst (autosomes)") +
  theme_light() +
  geom_density() +
  theme(plot.title = element_text(hjust = 0.5)) 

dev.off()
