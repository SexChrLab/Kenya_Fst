#!/usr/bin/Rscript
# Author: Angela Taravella Oill
# ___usage___
# Rscript figure.02.R <fst_results_file> <out file name and path>

# Description:
# This script will make the main figure 2 plot for the manuscript.
# Figure 2 is a three panel plot of Fst. A) ADMIXTURE plot, B) TS level Fst, 
# B) TS vs ethnolinguistic group Fst with p-values.

#--------------------#
### LOAD LIBRARIES ###
#--------------------#
library(ggplot2)
library(ggpubr)
library(gridExtra)
library(grid)

#---------------------------#
### SET UP COMMAND INPUTS ###
#---------------------------#
args = commandArgs(trailingOnly=TRUE)
fstresults = args[1]
outname = args[2]

#-------------------------------#
### READ IN DATA FOR PLOTTING ###
#-------------------------------#
fst_results <- read.table(fstresults, sep = "\t", header = F)

# Add info to fst results
# merge col 1 and 2. These are the 2 populations Fst was calculated for
fst_results$combo <- paste(fst_results$V1, "-", fst_results$V2, sep = "")
# Add name to the 4th column. This is the Fst value
names(fst_results)[4] <- "fst"

#------------------------------#
### SUBSET DATA FOR PLOTTING ###
#------------------------------#
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
#fst_results_ts_eth$poplab <- fst_results_ts_eth$V2
# Fix pop label
for (i in 1:nrow(fst_results_ts_eth)) {
  if (fst_results_ts_eth[i,5] == "rendille-turkana" | 
      fst_results_ts_eth[i,5] == "kwatela.blood.ts-rendille" |
      fst_results_ts_eth[i,5] == "ngibochoros.blood.ts-rendille" |
      fst_results_ts_eth[i,5] == "ngiyapakuno.blood.ts-rendille" ) {
    fst_results_ts_eth[i,"poplab"] <- "Rendille"; fst_results_ts_eth
  }
  else if (fst_results_ts_eth[i,5] == "borana-turkana" | 
           fst_results_ts_eth[i,5] == "kwatela.blood.ts-borana" |
           fst_results_ts_eth[i,5] == "ngibochoros.blood.ts-borana" |
           fst_results_ts_eth[i,5] == "ngiyapakuno.blood.ts-borana") {
    fst_results_ts_eth[i,"poplab"] <- "Borana"; fst_results_ts_eth
  }
  else if (fst_results_ts_eth[i,5] == "samburu-turkana" | 
           fst_results_ts_eth[i,5] == "kwatela.blood.ts-samburu" |
           fst_results_ts_eth[i,5] == "ngibochoros.blood.ts-samburu" |
           fst_results_ts_eth[i,5] == "ngiyapakuno.blood.ts-samburu") {
    fst_results_ts_eth[i,"poplab"] <- "Samburu"; fst_results_ts_eth
  }
}


#----------#
### PLOT ###
#----------#
# Figure 2A: ADMIXTURE plot #
# This will be blank and added in power point
fig2a <- ggplot() + theme_void()

# Figure 2B: Turkana TS Fst bar plot #
fig2b <- ggplot(fst_results_ts, aes(x = combo, y = fst)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black", fill = "#66CC99") +
  scale_x_discrete(limits=c("kwatela.blood.ts-ngibochoros.blood.ts", "ngibochoros.blood.ts-ngiyapakuno.blood.ts",
                            "kwatela.blood.ts-ngiyapakuno.blood.ts"), 
                   labels=c("kwatela.blood.ts-ngiyapakuno.blood.ts" = "Kwatela-Ngiyapakuno",
                            "kwatela.blood.ts-ngibochoros.blood.ts" = "Ngibochoros-Kwatela",
                            "ngibochoros.blood.ts-ngiyapakuno.blood.ts" = "Ngibochoros-Ngiyapakuno")) +
  #ylim(0, max(fst_results_ts_eth$fst))+ # axis same as fig 2.b
  ylim(0, 0.021)+
  #ylim(0, 0.005)+
  ylab("Fst") + xlab("") +
  theme(axis.title.y=element_blank()) +
  guides(fill=guide_legend(title="Key")) +
  theme_bw() + 
  ggtitle("Turkana\nTerritorial Sections") +
  theme(text = element_text(size=14),
        panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "black"),
        plot.title = element_text(hjust = 0.5, face = "bold", size=14),
        axis.text.x = element_text(angle = 45, hjust = 1)) + 
  coord_flip() 

# Figure 2C: Turkana TS vs other ethnic group Fst #
fst_results_ts_eth_sub <- subset(fst_results_ts_eth, 
                                 V1 == "kwatela.blood.ts" | 
                                   V1 == "ngiyapakuno.blood.ts" | 
                                   V1 == "ngibochoros.blood.ts")
# Make data frames with each pop separately. To use for annotating p-values
# on the plot
sub_df_b <- subset(fst_results_ts_eth, poplab == "Borana")
sub_df_b_2 <- subset(sub_df_b, combo != "borana-turkana")
sub_df_r <- subset(fst_results_ts_eth, poplab == "Rendille")
sub_df_r_2 <- subset(sub_df_r, combo != "rendille-turkana")
sub_df_s <- subset(fst_results_ts_eth, poplab == "Samburu")
sub_df_s_2 <- subset(sub_df_s, combo != "samburu-turkana")


fig2c <- ggplot(fst_results_ts_eth_sub, aes(x = V1, y = fst, fill = combo)) +
  geom_bar(stat="identity",  colour="black") + 
  facet_grid(~poplab) + 
  coord_flip() +
  scale_fill_manual(values=c(
    "kwatela.blood.ts-borana" = "#6094C3",
    "kwatela.blood.ts-rendille" = "#6094C3",
    "kwatela.blood.ts-samburu" = "#6094C3",
    "ngiyapakuno.blood.ts-borana" = "#6094C3",
    "ngiyapakuno.blood.ts-rendille" = "#6094C3",
    "ngiyapakuno.blood.ts-samburu" = "#6094C3",
    "ngibochoros.blood.ts-borana" = "#A76BB2",
    "ngibochoros.blood.ts-rendille" = "#A76BB2",
    "ngibochoros.blood.ts-samburu" = "#A76BB2")) +
  scale_x_discrete(limits=c(
    "kwatela.blood.ts", "ngiyapakuno.blood.ts", "ngibochoros.blood.ts"
  ),
  labels=c(
    "kwatela.blood.ts" = "Kwatela",
    "ngiyapakuno.blood.ts" = "Ngiyapakuno",
    "ngibochoros.blood.ts" = "Ngibochoros"
  )) +
  #ylim(0, max(fst_results_ts_eth$fst))+
  ylim(0, 0.021)+
  geom_col() +  ylab("Fst") + xlab("") +
  theme_bw() + 
  theme(legend.position = "none",
        text = element_text(size=14),
        panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "black"),
        strip.text.x = element_text(face = "bold", size=14),
        axis.text.x = element_text(angle = 45, hjust = 1)
  ) +
  #geom_hline(aes(yintercept = z), vline.data, linetype="dotted", color = "red", size = 1.25) +
  #annotate(geom="text", x=1.5, y=0.0175, label="ns",color="black", angle="270", data=sub_df_b_2) +
  # Borana
  geom_segment(aes(x=1, y=0.0165, xend=1.9, yend=0.0165), size=0.7, data=sub_df_b_2) +
  geom_segment(aes(x=1, y=0.0165, xend=1, yend=0.016), size=0.7, data=sub_df_b_2) +
  geom_segment(aes(x=1.9, y=0.0165, xend=1.9, yend=0.016), size=0.7, data=sub_df_b_2) +
  geom_text(x=1.5, y=0.0175, label="p = 0.14", data=sub_df_b_2, angle = "270", size = 3) +
  
  geom_segment(aes(x=2, y=0.0165, xend=2.9, yend=0.0165), size=0.7, data=sub_df_b_2) +
  geom_segment(aes(x=2, y=0.0165, xend=2, yend=0.016), size=0.7, data=sub_df_b_2) +
  geom_segment(aes(x=2.9, y=0.0165, xend=2.9, yend=0.016), size=0.7, data=sub_df_b_2) +
  geom_text(x=2.5, y=0.0175, label="p = 0.25", data=sub_df_b_2, angle = "270", size = 3) +
  
  geom_segment(aes(x=.9, y=0.019, xend=3, yend=0.019), size=0.7, data=sub_df_b_2) +
  geom_segment(aes(x=.9, y=0.019, xend=.9, yend=0.0185), size=0.7, data=sub_df_b_2) +
  geom_segment(aes(x=3, y=0.019, xend=3, yend=0.0185), size=0.7, data=sub_df_b_2) +
  geom_text(x=2, y=0.02, label="p = 0.64", data=sub_df_b_2, angle = "270", size = 3) +
  
  # Rendille
  geom_segment(aes(x=1, y=0.018, xend=1.9, yend=0.018), size=0.7, data=sub_df_r_2) +
  geom_segment(aes(x=1, y=0.018, xend=1, yend=0.0175), size=0.7, data=sub_df_r_2) +
  geom_segment(aes(x=1.9, y=0.018, xend=1.9, yend=0.0175), size=0.7, data=sub_df_r_2) +
  geom_text(x=1.5, y=0.019, label="p = 0.19", data=sub_df_r_2, angle = "270", size = 3) +
  
  geom_segment(aes(x=2, y=0.018, xend=2.9, yend=0.018), size=0.7, data=sub_df_r_2) +
  geom_segment(aes(x=2, y=0.018, xend=2, yend=0.0175), size=0.7, data=sub_df_r_2) +
  geom_segment(aes(x=2.9, y=0.018, xend=2.9, yend=0.0175), size=0.7, data=sub_df_r_2) +
  geom_text(x=2.5, y=0.019, label="p = 0.33", data=sub_df_r_2, angle = "270", size = 3) +
  
  geom_segment(aes(x=.9, y=0.02, xend=3, yend=0.02), size=0.7, data=sub_df_r_2) +
  geom_segment(aes(x=.9, y=0.02, xend=.9, yend=0.0195), size=0.7, data=sub_df_r_2) +
  geom_segment(aes(x=3, y=0.02, xend=3, yend=0.0195), size=0.7, data=sub_df_r_2) +
  geom_text(x=2, y=0.021, label="p = 0.67", data=sub_df_r_2, angle = "270", size = 3) +
  
  # Samburu
  geom_segment(aes(x=1, y=0.0105, xend=1.9, yend=0.0105), size=0.7, data=sub_df_s_2) +
  geom_segment(aes(x=1, y=0.0105, xend=1, yend=0.01), size=0.7, data=sub_df_s_2) +
  geom_segment(aes(x=1.9, y=0.0105, xend=1.9, yend=0.01), size=0.7, data=sub_df_s_2) +
  geom_text(x=1.5, y=0.0115, label="p = 0.21", data=sub_df_s_2, angle = "270", size = 3) +
  
  geom_segment(aes(x=2, y=0.0105, xend=2.9, yend=0.0105), size=0.7, data=sub_df_s_2) +
  geom_segment(aes(x=2, y=0.0105, xend=2, yend=0.01), size=0.7, data=sub_df_s_2) +
  geom_segment(aes(x=2.9, y=0.0105, xend=2.9, yend=0.01), size=0.7, data=sub_df_s_2) +
  geom_text(x=2.5, y=0.0115, label="p = 0.06", data=sub_df_s_2, angle = "270", size = 3) +
  
  geom_segment(aes(x=.9, y=0.0125, xend=3, yend=0.0125), size=0.7, data=sub_df_s_2) +
  geom_segment(aes(x=.9, y=0.0125, xend=.9, yend=0.012), size=0.7, data=sub_df_s_2) +
  geom_segment(aes(x=3, y=0.0125, xend=3, yend=0.012), size=0.7, data=sub_df_s_2) +
  geom_text(x=2, y=0.0135, label="p = 0.55", data=sub_df_s_2, angle = "270", size = 3) 


### OUTPUT RESULTS ###
pdf(outname, width = 11, height = 7)
ggarrange(fig2a, fig2a, fig2b, fig2c, 
          ncol = 2, nrow = 2, 
          labels = c("A", "", "B", "  C"),
          widths = c(1, 1.75))

dev.off()
