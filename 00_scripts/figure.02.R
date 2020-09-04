#!/usr/bin/Rscript
# Author: Angela Taravella Oill
# ___usage___
# Rscript figure.02.R <fst_results_file> <out file name and path>

# Description:
# This script will make the main figure 2 plot for the manuscript.
# Figure 2 is a two panel plot of Fst. A) TS level Fst, B) TS vs ethnolinguistic
# group Fst

### LOAD LIBRARIES ###
library(ggplot2)
library(ggpubr)
library(gridExtra)
library(grid)

### SET UP COMMAND INPUTS ###
args = commandArgs(trailingOnly=TRUE)
fstresults = args[1]
outname = args[2]

pdf(outname, height = 8, width = 10)
#pdf("../Figures/figure.02.pdf", height = 8, width = 10)

### READ IN DATA FOR PLOTTING ###
fst_results <- read.table(fstresults, sep = "\t", header = F)
#fst_results <- read.table("all.results.Fst.table.txt", sep = "\t", header = F)

# Add info to fst results
# merge col 1 and 2. These are the 2 populations Fst was calculated for
fst_results$combo <- paste(fst_results$V1, "-", fst_results$V2, sep = "")
# Add name to the 4th column. This is the Fst value
names(fst_results)[4] <- "fst"

### SUBSET DATA FOR PLOTTING ###
# TS - Figure 2 A
fst_results_ts <- fst_results[ which(fst_results$combo=='kwatela.blood.ts-ngibochoros.blood.ts'
                                     | fst_results$combo=='kwatela.blood.ts-ngiyapakuno.blood.ts'
                                     | fst_results$combo=='ngibochoros.blood.ts-ngiyapakuno.blood.ts' ), ]

# TS vs ethnolinguistic group - Figure 2 B
fst_results_ts_eth <- fst_results[ which(fst_results$combo=='rendille-turkana'
                                     | fst_results$combo=='ngibochoros.blood.ts-rendille'
                                     | fst_results$combo=='ngiyapakuno.blood.ts-rendille'
                                     | fst_results$combo=='kwatela.blood.ts-rendille'
                                     | fst_results$combo=='borana-turkana'
                                     | fst_results$combo=='ngibochoros.blood.ts-borana'
                                     | fst_results$combo=='ngiyapakuno.blood.ts-borana'
                                     | fst_results$combo=='kwatela.blood.ts-borana'
                                     | fst_results$combo=='samburu-turkana'
                                     | fst_results$combo=='ngibochoros.blood.ts-samburu'
                                     | fst_results$combo=='ngiyapakuno.blood.ts-samburu'
                                     | fst_results$combo=='kwatela.blood.ts-samburu'), ]

# Make a pop label col
fst_results_ts_eth$poplab <- fst_results_ts_eth$V2
# Fix pop label
for (i in 1:nrow(fst_results_ts_eth)) {
  if (fst_results_ts_eth[i,5] == "rendille-turkana") {
    fst_results_ts_eth[i,"poplab"] <- "rendille"; fst_results_ts_eth
  }
  else if (fst_results_ts_eth[i,5] == "borana-turkana") {
    fst_results_ts_eth[i,"poplab"] <- "borana"; fst_results_ts_eth
  }
  else if (fst_results_ts_eth[i,5] == "samburu-turkana") {
    fst_results_ts_eth[i,"poplab"] <- "samburu"; fst_results_ts_eth
  }
}

### PLOT ###
fig2a <- ggplot(fst_results_ts, aes(x = combo, y = fst)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black", fill="#66CC99") +
  scale_x_discrete(limits=c("kwatela.blood.ts-ngibochoros.blood.ts", "ngibochoros.blood.ts-ngiyapakuno.blood.ts",
                            "kwatela.blood.ts-ngiyapakuno.blood.ts"), 
                   labels=c("kwatela.blood.ts-ngiyapakuno.blood.ts" = "Kwatela-Ngiyapakuno",
                            "kwatela.blood.ts-ngibochoros.blood.ts" = "Ngibochoros-Kwatela",
                            "ngibochoros.blood.ts-ngiyapakuno.blood.ts" = "Ngibochoros-Ngiyapakuno")) +
  ylim(0, max(fst_results_ts_eth$fst))+ # axis same as fig 2.b
  ylab("Fst") +
  theme(axis.title.y=element_blank()) +
  guides(fill=guide_legend(title="Key")) +
  theme_bw() + 
  theme(text = element_text(size=18),
        axis.title.x=element_blank(),
        panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "black"),
        axis.text.x = element_text(angle = 45, hjust = 1)) 

# Figure 2.b
fig2b <- ggplot(fst_results_ts_eth, aes(x = combo, y = fst, fill = poplab)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  scale_x_discrete(limits=c(
    "rendille-turkana", "ngibochoros.blood.ts-rendille", "ngiyapakuno.blood.ts-rendille", "kwatela.blood.ts-rendille",
    "borana-turkana", "ngibochoros.blood.ts-borana", "ngiyapakuno.blood.ts-borana", "kwatela.blood.ts-borana",
    "samburu-turkana", "ngibochoros.blood.ts-samburu", "ngiyapakuno.blood.ts-samburu", "kwatela.blood.ts-samburu"), 
    labels=c(
      "rendille-turkana" = "Turkana-Rendille", 
      "ngibochoros.blood.ts-rendille" = "Ngibochoros-Rendille",
      "ngiyapakuno.blood.ts-rendille" = "Ngiyapakuno-Rendille",
      "kwatela.blood.ts-rendille" = "Kwatela-Rendille",
      "borana-turkana" = "Turkana-Borana",
      "ngibochoros.blood.ts-borana" = "Ngibochoros-Borana",
      "ngiyapakuno.blood.ts-borana" = "Ngiyapakuno-Borana",
      "kwatela.blood.ts-borana" = "Kwatela-Borana", 
      "samburu-turkana" = "Turkana-Samburu",
      "ngibochoros.blood.ts-samburu" = "Ngibochoros-Samburu",
      "ngiyapakuno.blood.ts-samburu" = "Ngiyapakuno-Samburu",
      "kwatela.blood.ts-samburu" = "Kwatela-Samburu"
    )) +
  ylim(0, max(fst_results_ts_eth$fst))+
  geom_col() +  ylab("Fst") +
  theme_bw() + 
  theme(axis.title.x=element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none",
        text = element_text(size=18),
        panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "black")) +
  scale_fill_brewer(palette = "BuPu") 


# Place together on one plot
ggarrange(fig2a, fig2b, ncol = 2, nrow = 1, align="h", labels = c("A", "B"))

dev.off()
