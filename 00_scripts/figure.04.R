#!/usr/bin/Rscript
# Author: Angela Taravella Oill
# ___usage___
# Rscript figure.03.R <fst_results_file> <average_distance_file> <out_file_name_and_path>

# Description:
# This script will make the main figure 4 plot for the manuscript.
# Figure 4 is a bar plot of ethnolinguistic level Fst and a line plot with the 
# average distance between two groups.

#--------------------#
### LOAD LIBRARIES ###
#--------------------#
library(ggplot2)
library(ggpubr)
library(gridExtra)
library(grid)
library(dplyr)
library(patchwork)
library(hrbrthemes)

#---------------------------#
### SET UP COMMAND INPUTS ###
#---------------------------#
args = commandArgs(trailingOnly=TRUE)
fstresults = args[1]
distanceresults = args[2]
outname = args[3]


#-------------------------------#
### READ IN DATA FOR PLOTTING ###
#-------------------------------#
fst_results <- read.table(fstresults, sep = "\t", header = F)
distance_results <- read.table(distanceresults, sep = "\t", header = F)

# Add info to fst results
# merge col 1 and 2. These are the 2 populations Fst was calculated for
fst_results$combo <- paste(fst_results$V1, "-", fst_results$V2, sep = "")
# Add name to the 4th column. This is the Fst value
names(fst_results)[4] <- "fst"


#------------------------------#
### SUBSET DATA FOR PLOTTING ###
#------------------------------#
fst_results_eth <- fst_results[ which(fst_results$combo=="borana-rendille"
                                      | fst_results$combo=="borana-samburu"
                                      | fst_results$combo=="borana-turkana"
                                      | fst_results$combo=="rendille-samburu"
                                      | fst_results$combo=="rendille-turkana"
                                      | fst_results$combo=="samburu-turkana"), ]


#-----------------------#
### ADD PLOTTING INFO ###
#-----------------------#
# add pop label
fst_results_eth$poplab <- ""

for (i in 1:nrow(fst_results_eth)) {
  if (fst_results_eth[i,5] == "rendille-turkana" | 
      fst_results_eth[i,5] == "borana-turkana" |
      fst_results_eth[i,5] == "samburu-turkana") {
    fst_results_eth[i,"poplab"] <- "turkana"; fst_results_eth
  }
  else if (fst_results_eth[i,5] == "borana-samburu" |
           fst_results_eth[i,5] == "borana-rendille") {
    fst_results_eth[i,"poplab"] <- "borana"; fst_results_eth
  }
  else if (fst_results_eth[i,5] == "rendille-samburu") {
    fst_results_eth[i,"poplab"] <- "samburu"; fst_results_eth
  }
}

# add distance info
fst_results_eth$distance <- c(156, 172, 440,
                              111, 288, 349)
# Reorder for coloring
# create a vector with letters in the desired order
x <- c("turkana", "borana", "samburu")
fst_results_eth_reorder <- fst_results_eth %>%
  mutate(poplab =  factor(poplab, levels = x)) %>%
  arrange(poplab)


#----------#
### PLOT ###
#----------#
pdf(outname, height = 8, width = 8)

ggplot(fst_results_eth_reorder) +
  
  geom_bar(mapping = aes(x = combo, y = fst, fill = poplab), stat="identity", position=position_dodge(), colour="black") + 
  geom_point(mapping = aes(x = combo, y = distance * 1/27000)) + 
  geom_line(mapping = aes(group = 1, x = combo, y = distance * 1/27000)) +
  # Custom the Y scales:
  scale_y_continuous(
    
    # Features of the first axis
    name = "Fst",
    
    # Add a second axis and specify its features
    sec.axis = sec_axis(~ . * 27000, name="Distance (km)")
    #sec.axis = sec_axis( trans=~.*1, name="Distance (km)")
  ) +
  scale_x_discrete(limits=c("rendille-turkana", "borana-turkana", "samburu-turkana",
                            "borana-samburu", "borana-rendille", "rendille-samburu"), 
                   
                   labels=c("borana-rendille" = "Borana-Rendille", "borana-samburu" = "Borana-Samburu",
                            "borana-turkana" = "Turkana-Borana", "rendille-samburu" = "Samburu-Rendille",
                            "rendille-turkana" = "Turkana-Rendille", "samburu-turkana" = "Turkana-Samburu")) +
  
  scale_fill_brewer(palette = "Oranges", direction = -1) +
  
  theme_bw() + 
  theme(text = element_text(size=18), 
        plot.title = element_text(hjust = 0.5, face="bold"),
        axis.title.x=element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none",
        panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "black")) #+

dev.off()
