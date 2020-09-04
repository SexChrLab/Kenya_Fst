#!/usr/bin/Rscript
# Author: Angela Taravella Oill
# ___usage___
# Rscript plot_pca_outlier_analysis.R <sample_info_file> <pass 01_path_and_stem_name> <pass 02_path_and_stem_name> <pass 03_path_and_stem_name> <output_path_and_file_name>

# Description:
# Plots 3 pcas that iteratively remove outlier samples


### LOAD LIBRARIES ###
library(ggplot2)
library(ggpubr)


### SET UP COMMAND INPUTS ###
args = commandArgs(trailingOnly=TRUE)
smpl = args[1]
pass01 = args[2]
pass02 = args[3]
pass03 = args[4]
outname = args[5]

### SET UP OUTPUT PDF ###
pdf(outname, width = 12, height = 5)

### SET COLORS FOR PLOTTING ### 
pop.colors <- c( "TURKANA" = "#66CC99", "SAMBURU" = "#CC6699", 
                 "RENDILLE" = "#CC9933", "BORANA" = "#660066",
                 "N/A" = "grey")


### READ IN DATA FOR PLOTTING ###
sample_file <- read.csv(smpl, sep = ",", header = T)

evec01 = read.table(paste(pass01,".evec.fix", sep=""), header = F)
eval01 = read.table(paste(pass01,".eval", sep=""), header = F)

evec02 = read.table(paste(pass02,".evec.fix", sep=""), header = F)
eval02 = read.table(paste(pass02,".eval", sep=""), header = F)

evec03 = read.table(paste(pass03,".evec.fix", sep=""), header = F)
eval03 = read.table(paste(pass03,".eval", sep=""), header = F)


### COMBINE FILES FOR PLOTTING ###
sample_info_merge_01 <- merge(sample_file, evec01, by.x = "IID", by.y = "V1")
sample_info_merge_02 <- merge(sample_file, evec02, by.x = "IID", by.y = "V1")
sample_info_merge_03 <- merge(sample_file, evec03, by.x = "IID", by.y = "V1")

### PLOT ###

# PLOT 1
# Get % var 
pc.a <- eval01[1,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC1", " (",pc.a,"%)",sep="")
pc.b <- eval01[2,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC2"," (",pc.b,"%)",sep="")

# Color by Ethnolinguistic group and Turkana TS
fig1a <- ggplot(sample_info_merge_01, aes(x=V2, y=V3, color=ETHNOLINGUISTIC_GROUP, 
                                          shape = BLOOD_TERRITORIAL_SECTION)) + 
  geom_point(size = 2.5) + 
  scale_color_manual(values = pop.colors) + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  scale_shape_manual(values=c(3,16,2,16,16,16,16,1)) +
  theme(legend.position = "top") + 
  labs(color = "Ethnolingiustic Group", shape = "Territorial Section") +
  guides(col = guide_legend(ncol = 2, override.aes = list(size = 2),
                            title.position = "top"), 
         shape = guide_legend(ncol = 4, override.aes = list(size = 2),
                              title.position = "top"))

# PLOT 2
# PC 1 and 2
# % var 
pc.a <- eval02[1,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC1", " (",pc.a,"%)",sep="")
pc.b <- eval02[2,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC2"," (",pc.b,"%)",sep="")

# By Ethnolinguistic group and Turkana TS
fig1b <- ggplot(sample_info_merge_02, aes(x=V2, y=V3, color=ETHNOLINGUISTIC_GROUP, 
                                          shape = BLOOD_TERRITORIAL_SECTION)) + 
  geom_point(size = 2.5) + 
  scale_color_manual(values = pop.colors) + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  scale_shape_manual(values=c(3,16,2,16,16,16,16,1)) +
  theme(legend.position = "top") + 
  labs(color = "Ethnolingiustic Group", shape = "Territorial Section") +
  guides(col = guide_legend(ncol = 2, override.aes = list(size = 3),
                            title.position = "top"), 
         shape = guide_legend(ncol = 4, override.aes = list(size = 3),
                              title.position = "top"))

# PLOT 3
# PC 1 and 2
# % var 
pc.a <- eval03[1,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC1", " (",pc.a,"%)",sep="")
pc.b <- eval03[2,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC2"," (",pc.b,"%)",sep="")

# By Ethnolinguistic group and Turkana TS
fig1c <- ggplot(sample_info_merge_03, aes(x=V2, y=V3, color=ETHNOLINGUISTIC_GROUP, 
                                          shape = BLOOD_TERRITORIAL_SECTION)) + 
  geom_point(size = 2.5) + 
  scale_color_manual(values = pop.colors) + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  scale_shape_manual(values=c(3,16,2,16,16,16,16,1)) +
  theme(legend.position = "top") + 
  labs(color = "Ethnolingiustic Group", shape = "Territorial Section") +
  guides(col = guide_legend(ncol = 2, override.aes = list(size = 3),
                            title.position = "top"), 
         shape = guide_legend(ncol = 4, override.aes = list(size = 3),
                              title.position = "top"))

# Place together on one plot
ggarrange(fig1a, fig1b, fig1c, ncol = 3, nrow = 1, align="h", 
          labels = c("A", "B", "C"),
          common.legend = T)

dev.off()
