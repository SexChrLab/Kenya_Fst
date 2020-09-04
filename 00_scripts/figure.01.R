#!/usr/bin/Rscript
# Author: Angela Taravella Oill
# ___usage___
# Rscript figure.01.R <gps_points_file> <sample_info_file> <pca_path_and_stem_name> <output_path_and_file_name>

# Description:
# This script will make the main figure 1 plot for the manuscript.
# Figure 1 will have three panels. A) Map, B) PCA, C) ADMIXTURE. A and B will
# be on the top and C will be on the bottom.

### LOAD LIBRARIES ###
library(ggplot2)
library(tidyr)
library(ggpubr)
library(gridExtra)
library(grid)
#library(viridis)
#library(dplyr)
library("sf")
library("rnaturalearth")
library("rnaturalearthdata")


### SET UP COMMAND INPUTS ###
args = commandArgs(trailingOnly=TRUE)
mapinfo = args[1]
smpl = args[2]
inname = args[3]
outname = args[4]


### READ IN DATA FOR PLOTTING ###
map_points <- read.table(mapinfo, sep = "\t", header = T)
sample_file <- read.csv(smpl, sep = ",", header = T)
evec = read.table(paste(inname,".evec.fix", sep=""), header = F)
eval = read.table(paste(inname,".eval", sep=""), header = F)

#map_points <- read.table("average.coords.for.map.txt", sep = "\t", header = T)
#sample_file <- read.csv("kenya.snp.array.metadata.csv", sep = ",", header = T)
#evec = read.table("melissa_wilson.raw.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr1-22.geno0.05.hwe1e-50.LD_50-10-0.2.evec.fix", header = F)
#eval = read.table("melissa_wilson.raw.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr1-22.geno0.05.hwe1e-50.LD_50-10-0.2.eval", header = F)


### COMBINE FILES FOR PLOTTING ###
sample_info_merge <- merge(sample_file, evec, by.x = "IID", by.y = "V1")


### PLOT ###
pdf(outname, width = 8, height = 8)
#pdf("../Figures/figure.01.pdf", width = 8, height = 8)

###########
# Make Map
###########
# Figure 1A #
# Set colors for map
pop.colors <- c( "Turkana" = "#66CC99", "Samburu" = "#CC6699", "Rendille" = "#CC9933", "Borana" = "#660066")

# Make world data frame
world <- ne_countries(scale = "medium", returnclass = "sf") 
class(world)

fig1a <- ggplot(data = world) +
  theme(text = element_text(size=18),
        plot.background = element_rect(fill = "white"),
        panel.background = element_rect(fill = "lightblue"),
        axis.line.x = element_line(color = "grey"),
        legend.background=element_blank(),
        legend.key=element_blank(),
        legend.title=element_text(size=18),
        legend.text = element_text(size=12),
        legend.title.align=0.5
        #legend.position = "none"
  ) +
  geom_sf() +
  geom_point(data = map_points, 
             aes(x = longitude, y = latitude, color =pop, shape =ts), 
             size = 2.5
  ) +
  scale_color_manual(values = pop.colors) + 
  scale_shape_manual(values=c(3,2,0,16)) +
  coord_sf(xlim = c(33, 45), ylim = c(-5,6), expand = FALSE) +
  xlab("Longitude") +
  ylab("Latitude") +
  labs(color = "Ethnolinguistic Group", shape = "Territorial Section") + 
  guides(col = guide_legend(ncol = 2, override.aes = list(size = 2),
                            title.position = "top"), 
         shape = guide_legend(ncol = 3, override.aes = list(size = 2),
                              title.position = "top"))

###########
# Make PCA
###########
# Figure 1B #
pop.colors <- c( "TURKANA" = "#66CC99", "SAMBURU" = "#CC6699", 
                 "RENDILLE" = "#CC9933", "BORANA" = "#660066",
                 "N/A" = "grey")
ts.shapes <- c( "KWATELA" = 3, "LUKUMONG" = 1, "N/A" = 16,
                 "NGIBOCHOROS" = 2, "NGIJIE" = 1, "NGIKAMATAK" = 1,
                "NGISIGER" = 1, "NGISONYOKA" = 1, "NGIYAPAKUNO" =0
                )
# PC 1 and 2
# % var 
pc.a <- eval[1,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC1", " (",pc.a,"%)",sep="")
pc.b <- eval[2,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC2"," (",pc.b,"%)",sep="")

# By pop and Turkana TS
fig1b <- ggplot(sample_info_merge, aes(x=V2, y=V3, color=ETHNOLINGUISTIC_GROUP, shape = BLOOD_TERRITORIAL_SECTION)) + 
  geom_point(size = 2.5) + 
  scale_color_manual(values = pop.colors) + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  #scale_shape_manual(values=c(3, 1, 16, 2, 1, 1, 1, 1, 0)) +
  scale_shape_manual(values=ts.shapes) +
  theme(text = element_text(size=18), 
        legend.position = "top"
        # , legend.title=element_text(size=10),
        #legend.text=element_text(size=8)
  ) + 
  labs(color = "Ethnolinguistic Group", shape = "Territorial Section") +
  guides(col = guide_legend(ncol = 2, override.aes = list(size = 3),
                            title.position = "top"), 
         shape = guide_legend(ncol = 3, override.aes = list(size = 3),
                              title.position = "top"))


#################
# Make empty plot
#################
# Figure 1C #
# Fig 1 C will be pasted in - ADMIXTURE plot
fig1c <- ggplot() + theme_void()

# Place together on one plot
ggarrange(fig1a, fig1b, fig1c, ncol = 2, nrow = 2, align="h", 
          labels = c("A", "B", "C"),
          common.legend = T)
dev.off()

