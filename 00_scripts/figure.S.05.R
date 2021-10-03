#!/usr/bin/Rscript
# Author: Angela Taravella Oill
# ___usage___
# Rscript figure.S.05.R <sample_info_file> <pca_path_and_stem_name> <output_path_and_file_name>

# Description:
# This script will make figure S 5 for the manuscript.
# Figure 1 will have three panels. All will be the same PCA just colored based 
# on A) ethnic group, B) natal clan affiliation, and C) post-marital clan 
# affiliation.

#--------------------#
### LOAD LIBRARIES ###
#--------------------#
library(ggplot2)
library(tidyr)
library(ggpubr)
library(gridExtra)
library(grid)
library(cowplot)
library(rgeos)

#---------------------------#
### SET UP COMMAND INPUTS ###
#---------------------------#
args = commandArgs(trailingOnly=TRUE)
smpl = args[1]
inname = args[2]
outname = args[3]


#-------------------------------#
### READ IN DATA FOR PLOTTING ###
#-------------------------------#
sample_file <- read.csv(smpl, sep = ",", header = T)
evec <- read.table(paste(inname,".evec.fix", sep=""), header = F)
eval <- read.table(paste(inname,".eval", sep=""), header = F)


#--------------------------------#
### COMBINE FILES FOR PLOTTING ###
#--------------------------------#
sample_info_merge <- merge(sample_file, evec, by.x = "IID", by.y = "V1")


#----------#
### PLOT ###
#----------#
pdf(outname, width = 11, height = 7)

# Figure 1A #
pop.colors <- c( "Turkana" = "#66CC99", "Samburu" = "#CC6699", 
                 "Rendille" = "#CC9933", "Borana" = "#660066")#,
                 #"N/A" = "grey")
ts.shapes <- c( "Kwatela" = 3, "None" = 16,
                 "Ngibochoros" = 2, "Ngiyapakuno" =0,
                "Other" = 1
                )

# PC 1 and 2
# % var 
pc.a <- eval[1,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC1", " (",pc.a,"%)",sep="")
pc.b <- eval[2,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC2"," (",pc.b,"%)",sep="")


# Color by pop only
a <- ggplot(sample_info_merge, aes(x=V2, y=V3, color=ETHNOLINGUISTIC_GROUP_FOR_PLOTTING,
                                   shape = ETHNOLINGUISTIC_GROUP_FOR_PLOTTING)) + 
  geom_point(size = 2.5) + 
  scale_color_manual(values = pop.colors) + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  labs(color = "Ethnolinguistic Group", shape = "Territorial Section") +
  guides(col = guide_legend(ncol = 2, override.aes = list(size = 2),
                            title.position = "top")) +
  theme(text = element_text(size=14), 
        legend.position = "none"
  )


unique.colors.all.clans <- c(
  " " = "white",
  "NGIBILAE" = "#0B610B", "NGIDOCA" = "#53A751", "NGIDUYA" = "#619462", "NGIKALESO" = "#04B404",
  "NGIMACARAMUKATA" = "#6F8272", "NGIMETURANA" = "#46A06A", "NGINGOLEROTO" = "#3984A9", "NGIPONGAA" = "#3984A9",
  "NGIPUCO" = "#3E8D94", "NGISIGER" = "#42977F", "NGITARAPOKOLONG" = "#46A06A", "NGITESO" = "#4AA955", 
  "NGIKATAP" = "#58FAAC", 
  "NGISALIKA" = "#04B4AE", # end of Turkana 

  "   " = "white",
  #"DIGALUU" = "#C32C39", 
  "DIGALUU" = "#BCA9F5", 
  "GABBRA" = "#9A2EFE", "HAWAXUU" = "#616592", "KARRAYU" = "#7D7083",
  "MATHAARI" = "#8B5D94", "NOONITUU" = "#9A4F9E", "ODITU" = "#AE587F", "WARRAJIDAA" = "#4B088A", # end of Borana

  "     " = "white",
  "LTUPCHA" = "#D3AC2D", 
  "LDUPSAI" = "#C28C2B", "LKATILLAN" = "#FC7D04", "LOIMISI" = "#FF9308", 
  #"LongieliSamburu" = "#FFAB11", 
  #"Matarbah" = "#FFC41B", 
  "NAAHAAGAN" = "#FFDC25", "RONGUMO" = "#FFF42E", "SAALE" = "#F5EC31", "SAMBURU-LOIMISI" = "#FFAB11", 
  "UYAM" = "#E4CC2F", # end of Rendille

  "       " = "white",
  "LMASULA" = "#FF00FF" , "LNGWESI" = "#FA58D0", 
  #"Lnyaparei" = "#B26C29", 
  #"Loimisi" = "#AA5830", 
  "LONGIELI" = "#B9604C", "LOROGISHU" = "#C96869", "LPISIKISHU" = "#D87085", "LUKUMAI" = "#E778A2", 
  "SAMBURU-LMASULA" = "#F6CEF5", 
  "SAMBURU-LONGIELI" = "#F8E0F1", 
  "SAMBURU-UNKNOWN" = "grey", # light grey #E6E6E6
  "RENDILLE-UNKNOWN" = "grey", # light grey #D8D8D8 # end of Samburu
  "        " = "white",
    
  "OTHER-UNKNOWN" = "grey", # dark grey # this was a Borana sample
  "N/A" = "grey" #585858
)

# Figure 1B #
# Shapes by pop and color by Natal Clan
b <- ggplot(sample_info_merge, aes(x=V2, y=V3, color=BLOOD_CLAN_OR_MARK, 
                              shape = ETHNOLINGUISTIC_GROUP_FOR_PLOTTING)) + 
  geom_point(size = 2.5) + 
  scale_color_manual(values = unique.colors.all.clans) + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  labs(color = "Clan Affiliation", shape = "Ethnolinguistic Group") +
  guides(col = guide_legend(ncol = 4, override.aes = list(size = 2),
                            title.position = "top"), 
         shape = guide_legend(ncol = 1, override.aes = list(size = 2),
                              title.position = "top")) +
  theme(text = element_text(size=14), 
        legend.position = "bottom",legend.title=element_text(size=18)
  )

# Figure 1C #
c <- ggplot(sample_info_merge, aes(x=V2, y=V3, color=CULTURAL_CLAN_OR_MARK, 
                              shape = ETHNOLINGUISTIC_GROUP_FOR_PLOTTING)) + 
  geom_point(size = 2.5) + 
  scale_color_manual(values = unique.colors.all.clans) + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  labs(color = "Clan Affiliation", shape = "Ethnolinguistic Group") +
  guides(col = guide_legend(ncol = 4, override.aes = list(size = 2),
                            title.position = "top"), 
         shape = guide_legend(ncol = 1, override.aes = list(size = 2),
                              title.position = "top")) +
  theme(text = element_text(size=14), 
        legend.position = "bottom", legend.title=element_text(size=18),
  )



ggarrange(a, b, c,
          ncol = 3, nrow = 1, align="hv", 
          labels = c("A", "B", "C"),
          legend.grob = get_legend(b),
          legend="bottom")

dev.off()
