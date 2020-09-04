#!/usr/bin/Rscript
# Author: Angela Taravella Oill
# ___usage___
# Rscript plot_pca_general.R <sample_info_file> <pca_path_and_stem_name> <output_path_and_file_stem_name>

# Description:
# Plots PCs 1-10 and colors by 1) Ethnolinguistic group, 2) blood clan, 
# 3) cultural clan, 4) blood territorial section, 5) cultural territorial seciton.
# Then it makes a separate 3 panel plot of PC 1 and 2 colored by a) Ethnolinguistic 
# group, b) blood clan, and c) cultural clan


### LOAD LIBRARIES ###
library(ggplot2)
library(ggpubr)
library(cowplot)
library(grid)
library(gridExtra) 
library(RColorBrewer)

### SET UP COMMAND INPUTS ###
args = commandArgs(trailingOnly=TRUE)
smpl = args[1]
inname = args[2]
outname = args[3]


### SET COLORS FOR PLOTTING ### 
pop.colors <- c( "TURKANA" = "#66CC99", "SAMBURU" = "#CC6699", 
                 "RENDILLE" = "#CC9933", "BORANA" = "#660066",
                 "N/A" = "grey")

unique.colors.all.clans <- c(
  "NGIBILAE" = "#E41A1C", "NGIDOCA" = "#53A751", "NGIDUYA" = "#619462", "NGIKALESO" = "#815274",
  "NGIMACARAMUKATA" = "#6F8272", "NGIMETURANA" = "#46A06A", "NGINGOLEROTO" = "#3984A9", "NGIPONGAA" = "#3984A9",
  "NGIPUCO" = "#3E8D94", "NGISIGER" = "#42977F", "NGITARAPOKOLONG" = "#46A06A", "NGITESO" = "#4AA955",
  "NGIKATAP" = "#99CCCC", "NGISALIKA" = "#4D5544", # end of Turkana 
  
  "DIGALUU" = "#C32C39", "DIGALU" = "#C32C39", "GABBRA" = "#A23F57", "HAWAXUU" = "#616592", "KARRAYU" = "#7D7083",
  "MATHAARI" = "#8B5D94", "NOONITUU" = "#9A4F9E", "ODITU" = "#AE587F", "WARRAJIDAA" = "#C16160", 
  "OTHER-UNKNOWN" = "grey", # end of Borana
  
  "LTUPCHA" = "#D3AC2D", "LDUPSAI" = "#C28C2B", "LKATILLAN" = "#FC7D04",  
  "LongieliSamburu" = "#FFAB11", "Matarbah" = "#FFC41B", 
  "NAAHAAGAN" = "#FFDC25", "RONGUMO" = "#FFAB11",
  #"RONGUMO" = "#FFF42E",
  "SAALE" = "#F5EC31", "UYAM" = "#E4CC2F", 
  "SAMBURU-LMASULA" = "#D56B42", "SAMBURU-LONGIELI" = "#B9604C", "SAMBURU-LOIMISI" = "#AA5830", 
  "SAMBURU-LOROGUSHU" = "#C96869", "SAMBURU-UNKNOWN" = "grey", # end of Rendille
  
  "LMASULA" = "#D56B42" , "LNGWESI" = "#E87423", 
  "Lnyaparei" = "#B26C29", 
  "LOIMISI" = "#AA5830", 
  "LONGIELI" = "#B9604C", "LOROGISHU" = "#C96869", "LPISIKISHU" = "#D87085", "LUKUMAI" = "#E778A2", 
  "RENDILLE-UNKNOWN" = "grey", # end of Samburu
  
  #"LOIMISI" = "#FF9308",
  "MISSING" = "grey", "N/A" = "grey" # others
)


### READ IN DATA FOR PLOTTING ###
sample_file <- read.csv(smpl, sep = ",", header = T)
evec = read.table(paste(inname,".evec.fix", sep=""), header = F)
eval = read.table(paste(inname,".eval", sep=""), header = F)

#sample_file <- read.csv("kenya.snp.array.metadata.csv", sep = ",", header = T)
#evec = read.table("melissa_wilson.raw.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr1-22.geno0.05.hwe1e-50.LD_50-10-0.2.outliers02Rm.evec.fix", header = F)
#eval = read.table("melissa_wilson.raw.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr1-22.geno0.05.hwe1e-50.LD_50-10-0.2.outliers02Rm.eval", header = F)


### COMBINE FILES FOR PLOTTING ###
sample_info_merge <- merge(sample_file, evec, by.x = "IID", by.y = "V1")


### PLOT ###
pdf(paste(outname, ".pca.results.01.pdf", sep = ""), width = 12, height = 12)

#--------------------------------------------
# Plot set 1: Color by ethno linguistic group
#--------------------------------------------
# PC1 and 2
# % var 
pc.a <- eval[1,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC1", " (",pc.a,"%)",sep="")
pc.b <- eval[2,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC2"," (",pc.b,"%)",sep="")
# plot
p1 <- ggplot(sample_info_merge, aes(x=V2, y=V3, color=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  scale_color_manual(values = pop.colors) + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  #theme(legend.position = "none") + 
  labs(color = "Ethnolinguistic Group") 

# PC3 and 4
# % var 
pc.a <- eval[3,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC3", " (",pc.a,"%)",sep="")
pc.b <- eval[4,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC4"," (",pc.b,"%)",sep="")
# plot
p2 <- ggplot(sample_info_merge, aes(x=V4, y=V5, color=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  scale_color_manual(values = pop.colors) +
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none")

# PC5 and 6
# % var 
pc.a <- eval[5,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC5", " (",pc.a,"%)",sep="")
pc.b <- eval[6,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC6"," (",pc.b,"%)",sep="")
# plot
p3 <- ggplot(sample_info_merge, aes(x=V6, y=V7, color=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  scale_color_manual(values = pop.colors) +
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none")

# PC7 and 8
# % var 
pc.a <- eval[7,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC7", " (",pc.a,"%)",sep="")
pc.b <- eval[8,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC8"," (",pc.b,"%)",sep="")
# plot
p4 <- ggplot(sample_info_merge, aes(x=V8, y=V9, color=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  scale_color_manual(values = pop.colors) +
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none")

# PC9 and 10
# % var 
pc.a <- eval[9,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC9", " (",pc.a,"%)",sep="")
pc.b <- eval[10,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC10"," (",pc.b,"%)",sep="")
# plot
p5 <- ggplot(sample_info_merge, aes(x=V10, y=V11, color=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  scale_color_manual(values = pop.colors) +
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none")

# Place all plots on 1 page
ggarrange(p1, p2, p3, p4, p5, 
          ncol = 2, nrow = 3, common.legend = TRUE, align = "v")



#--------------------------------------------
# Plot set 2: Color by blood clan affiliation
#--------------------------------------------
# PC1 and 2
# % var 
pc.a <- eval[1,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC1", " (",pc.a,"%)",sep="")
pc.b <- eval[2,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC2"," (",pc.b,"%)",sep="")
# plot
p1 <- ggplot(sample_info_merge, aes(x=V2, y=V3, group=BLOOD_CLAN_OR_MARK)) + 
  geom_point(aes(shape=ETHNOLINGUISTIC_GROUP, color=BLOOD_CLAN_OR_MARK)) + 
  scale_color_manual(values = unique.colors.all.clans, na.value = "grey") + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  labs(color = "Blood Clan Affiliation", shape = "Ethnolinguistic Group") +
  theme(legend.key.size=unit(1,"point")) +
  guides(col = guide_legend(ncol = 4,
                            title.position = "top"), 
         shape = guide_legend(ncol = 2,
                              title.position = "top"))

# PC3 and 4
# % var 
pc.a <- eval[3,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC3", " (",pc.a,"%)",sep="")
pc.b <- eval[4,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC4"," (",pc.b,"%)",sep="")
# plot
p2 <- ggplot(sample_info_merge, aes(x=V4, y=V5, group=BLOOD_CLAN_OR_MARK)) + 
  geom_point(aes(shape=ETHNOLINGUISTIC_GROUP, color=BLOOD_CLAN_OR_MARK)) + 
  scale_color_manual(values = unique.colors.all.clans, na.value = "grey") + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") 

# PC5 and 6
# % var 
pc.a <- eval[5,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC5", " (",pc.a,"%)",sep="")
pc.b <- eval[6,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC6"," (",pc.b,"%)",sep="")
# plot
p3 <- ggplot(sample_info_merge, aes(x=V6, y=V7, group=BLOOD_CLAN_OR_MARK)) + 
  geom_point(aes(shape=ETHNOLINGUISTIC_GROUP, color=BLOOD_CLAN_OR_MARK)) + 
  scale_color_manual(values = unique.colors.all.clans, na.value = "grey") + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") 

# PC7 and 8
# % var 
pc.a <- eval[7,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC7", " (",pc.a,"%)",sep="")
pc.b <- eval[8,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC8"," (",pc.b,"%)",sep="")
# plot
p4 <- ggplot(sample_info_merge, aes(x=V8, y=V9, group=BLOOD_CLAN_OR_MARK)) + 
  geom_point(aes(shape=ETHNOLINGUISTIC_GROUP, color=BLOOD_CLAN_OR_MARK)) + 
  scale_color_manual(values = unique.colors.all.clans, na.value = "grey") + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") 

# PC9 and 10
# % var 
pc.a <- eval[9,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC9", " (",pc.a,"%)",sep="")
pc.b <- eval[10,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC10"," (",pc.b,"%)",sep="")
# plot
p5 <- ggplot(sample_info_merge, aes(x=V10, y=V11, group=BLOOD_CLAN_OR_MARK)) + 
  geom_point(aes(shape=ETHNOLINGUISTIC_GROUP, color=BLOOD_CLAN_OR_MARK)) + 
  scale_color_manual(values = unique.colors.all.clans, na.value = "grey") + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") 

# Place all plots on 1 page
ggarrange(p1, p2, p3, p4, p5, 
          ncol = 2, nrow = 3, common.legend = TRUE, align = "v")



#-----------------------------------------------
# Plot set 3: Color by culutral clan affiliation
#-----------------------------------------------
# PC1 and 2
# % var 
pc.a <- eval[1,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC1", " (",pc.a,"%)",sep="")
pc.b <- eval[2,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC2"," (",pc.b,"%)",sep="")
# plot
p1 <- ggplot(sample_info_merge, aes(x=V2, y=V3, group=CULTURAL_CLAN_OR_MARK)) + 
  geom_point(aes(shape=ETHNOLINGUISTIC_GROUP, color=CULTURAL_CLAN_OR_MARK)) + 
  scale_color_manual(values = unique.colors.all.clans, na.value = "grey") + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  #theme(legend.position = "none") + 
  labs(color = "Cultural Clan Affiliation", shape = "Ethnolinguistic Group") +
  theme(legend.key.size=unit(1,"point")) +
  guides(col = guide_legend(ncol = 4,
                            title.position = "top"), 
         shape = guide_legend(ncol = 2,
                              title.position = "top"))

# PC3 and 4
# % var 
pc.a <- eval[3,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC3", " (",pc.a,"%)",sep="")
pc.b <- eval[4,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC4"," (",pc.b,"%)",sep="")
# plot
p2 <- ggplot(sample_info_merge, aes(x=V4, y=V5, group=CULTURAL_CLAN_OR_MARK)) + 
  geom_point(aes(shape=ETHNOLINGUISTIC_GROUP, color=CULTURAL_CLAN_OR_MARK)) + 
  scale_color_manual(values = unique.colors.all.clans, na.value = "grey") + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") 

# PC5 and 6
# % var 
pc.a <- eval[5,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC5", " (",pc.a,"%)",sep="")
pc.b <- eval[6,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC6"," (",pc.b,"%)",sep="")
# plot
p3 <- ggplot(sample_info_merge, aes(x=V6, y=V7, group=CULTURAL_CLAN_OR_MARK)) + 
  geom_point(aes(shape=ETHNOLINGUISTIC_GROUP, color=CULTURAL_CLAN_OR_MARK)) + 
  scale_color_manual(values = unique.colors.all.clans, na.value = "grey") + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") 

# PC7 and 8
# % var 
pc.a <- eval[7,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC7", " (",pc.a,"%)",sep="")
pc.b <- eval[8,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC8"," (",pc.b,"%)",sep="")
# plot
p4 <- ggplot(sample_info_merge, aes(x=V8, y=V9, group=CULTURAL_CLAN_OR_MARK)) + 
  geom_point(aes(shape=ETHNOLINGUISTIC_GROUP, color=CULTURAL_CLAN_OR_MARK)) + 
  scale_color_manual(values = unique.colors.all.clans, na.value = "grey") + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") 

# PC9 and 10
# % var 
pc.a <- eval[9,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC9", " (",pc.a,"%)",sep="")
pc.b <- eval[10,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC10"," (",pc.b,"%)",sep="")
# plot
p5 <- ggplot(sample_info_merge, aes(x=V10, y=V11, group=CULTURAL_CLAN_OR_MARK)) + 
  geom_point(aes(shape=ETHNOLINGUISTIC_GROUP, color=CULTURAL_CLAN_OR_MARK)) + 
  scale_color_manual(values = unique.colors.all.clans, na.value = "grey") + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") 

# Place all plots on 1 page
ggarrange(p1, p2, p3, p4, p5, 
          ncol = 2, nrow = 3, common.legend = TRUE, align = "v")



#----------------------------------------------------------------
# Plot set 4: Color by blood territorial section. Other pops grey
#----------------------------------------------------------------
# convert N/A to na
sample_info_merge[sample_info_merge=="N/A"] = NA 

# PC1 and 2
# % var 
pc.a <- eval[1,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC1", " (",pc.a,"%)",sep="")
pc.b <- eval[2,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC2"," (",pc.b,"%)",sep="")
# plot
p1 <- ggplot(sample_info_merge, aes(x=V2, y=V3, color=BLOOD_TERRITORIAL_SECTION, shape=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  #scale_color_manual(values = pop.colors) + 
  scale_color_brewer(palette="Set1", na.value = "grey") +
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  #theme(legend.position = "none") + 
  labs(color = "Blood Territorial Section", shape = "Ethnolinguistic Group") +
  theme(legend.key.size=unit(1,"point")) +
  guides(col = guide_legend(ncol = 3,
                            title.position = "top"), 
         shape = guide_legend(ncol = 2,
                              title.position = "top"))

# PC3 and 4
# % var 
pc.a <- eval[3,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC3", " (",pc.a,"%)",sep="")
pc.b <- eval[4,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC4"," (",pc.b,"%)",sep="")
# plot
p2 <- ggplot(sample_info_merge, aes(x=V4, y=V5, color=BLOOD_TERRITORIAL_SECTION, shape=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  #scale_color_manual(values = pop.colors) + 
  scale_color_brewer(palette="Set1", na.value = "grey") +
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") #+ 
  #labs(color = "Blood Territorial Section", shape = "Ethnolinguistic Group") 


# PC5 and 6
# % var 
pc.a <- eval[5,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC5", " (",pc.a,"%)",sep="")
pc.b <- eval[6,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC6"," (",pc.b,"%)",sep="")
# plot
p3 <- ggplot(sample_info_merge, aes(x=V6, y=V7, color=BLOOD_TERRITORIAL_SECTION, shape=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  #scale_color_manual(values = pop.colors) + 
  scale_color_brewer(palette="Set1", na.value = "grey") +
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") #+ 
  #labs(color = "Blood Territorial Section", shape = "Ethnolinguistic Group") 

# PC7 and 8
# % var 
pc.a <- eval[7,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC7", " (",pc.a,"%)",sep="")
pc.b <- eval[8,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC8"," (",pc.b,"%)",sep="")
# plot
p4 <- ggplot(sample_info_merge, aes(x=V8, y=V9, color=BLOOD_TERRITORIAL_SECTION, shape=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  #scale_color_manual(values = pop.colors) + 
  scale_color_brewer(palette="Set1", na.value = "grey") +
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") #+ 
#labs(color = "Blood Territorial Section", shape = "Ethnolinguistic Group") 

# PC9 and 10
# % var 
pc.a <- eval[9,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC9", " (",pc.a,"%)",sep="")
pc.b <- eval[10,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC10"," (",pc.b,"%)",sep="")
# plot
p5 <- ggplot(sample_info_merge, aes(x=V10, y=V11, color=BLOOD_TERRITORIAL_SECTION, shape=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  #scale_color_manual(values = pop.colors) + 
  scale_color_brewer(palette="Set1", na.value = "grey") +
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") #+ 
#labs(color = "Blood Territorial Section", shape = "Ethnolinguistic Group") 

# Place all plots on 1 page
ggarrange(p1, p2, p3, p4, p5, 
          ncol = 2, nrow = 3, common.legend = TRUE, align = "v",
          labels = c("A", "B", "C", "D", "E"))



#--------------------------------------------------------------------
# Plot set 5: Color by culutral territorial section. Other pops grey
#--------------------------------------------------------------------
# PC1 and 2
# % var 
pc.a <- eval[1,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC1", " (",pc.a,"%)",sep="")
pc.b <- eval[2,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC2"," (",pc.b,"%)",sep="")
# plot
p1 <- ggplot(sample_info_merge, aes(x=V2, y=V3, color=CULTURAL_TERRITORIAL_SECTION, shape=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  #scale_color_manual(values = pop.colors) + 
  scale_color_brewer(palette="Set1", na.value = "grey") +
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  #theme(legend.position = "none") + 
  labs(color = "Cultural Territorial Section", shape = "Ethnolinguistic Group") +
  theme(legend.key.size=unit(1,"point")) +
  guides(col = guide_legend(ncol = 3,
                            title.position = "top"), 
         shape = guide_legend(ncol = 2,
                              title.position = "top"))

# PC3 and 4
# % var 
pc.a <- eval[3,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC3", " (",pc.a,"%)",sep="")
pc.b <- eval[4,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC4"," (",pc.b,"%)",sep="")
# plot
p2 <- ggplot(sample_info_merge, aes(x=V4, y=V5, color=CULTURAL_TERRITORIAL_SECTION, shape=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  #scale_color_manual(values = pop.colors) + 
  scale_color_brewer(palette="Set1", na.value = "grey") +
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") 

# PC5 and 6
# % var 
pc.a <- eval[5,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC5", " (",pc.a,"%)",sep="")
pc.b <- eval[6,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC6"," (",pc.b,"%)",sep="")
# plot
p3 <- ggplot(sample_info_merge, aes(x=V6, y=V7, color=CULTURAL_TERRITORIAL_SECTION, shape=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  #scale_color_manual(values = pop.colors) + 
  scale_color_brewer(palette="Set1", na.value = "grey") +
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") 

# PC7 and 8
# % var 
pc.a <- eval[7,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC7", " (",pc.a,"%)",sep="")
pc.b <- eval[8,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC8"," (",pc.b,"%)",sep="")
# plot
p4 <- ggplot(sample_info_merge, aes(x=V8, y=V9, color=CULTURAL_TERRITORIAL_SECTION, shape=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  #scale_color_manual(values = pop.colors) + 
  scale_color_brewer(palette="Set1", na.value = "grey") +
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") 

# PC9 and 10
# % var 
pc.a <- eval[9,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC9", " (",pc.a,"%)",sep="")
pc.b <- eval[10,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC10"," (",pc.b,"%)",sep="")
# plot
p5 <- ggplot(sample_info_merge, aes(x=V10, y=V11, color=CULTURAL_TERRITORIAL_SECTION, shape=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  #scale_color_manual(values = pop.colors) + 
  scale_color_brewer(palette="Set1", na.value = "grey") +
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  theme(legend.position = "none") 


# Place all plots on 1 page
ggarrange(p1, p2, p3, p4, p5, 
          ncol = 2, nrow = 3, common.legend = TRUE, align = "v",
          labels = c("A", "B", "C", "D", "E"))

dev.off()



#----------------------------------------------------------------------------------
# Plot set 6: PC 1 and 2 colored by ethnolinguistic group, blood, and cultural clan
#----------------------------------------------------------------------------------
pdf(paste(outname, ".pca.results.02.pdf", sep = ""), width = 12, height = 5)
# PC 1 and 2
# % var 
pc.a <- eval[1,1]
pc.a <- round(pc.a, digits = 2)
axis_pc.a <- paste("PC1", " (",pc.a,"%)",sep="")
pc.b <- eval[2,1]
pc.b <- round(pc.b, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc.b <- paste("PC2"," (",pc.b,"%)",sep="")
# plot
p1.bypop <- ggplot(sample_info_merge, aes(x=V2, y=V3, color=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  scale_color_manual(values = pop.colors) + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) +
  #theme(legend.position="top") +
  theme(legend.position = "none") +
  labs(color = "Ethnolinguistic Group") 


p1.bypop.ld <- ggplot(sample_info_merge, aes(x=V2, y=V3, color=ETHNOLINGUISTIC_GROUP)) + geom_point() + 
  scale_color_manual(values = pop.colors) + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) +
  labs(color = "Ethnolinguistic Group") +
  theme(legend.key.size=unit(1,"point")) +
  guides(col = guide_legend(ncol = 2,
                            title.position = "top"))

# plot
p1.bybclan <- ggplot(sample_info_merge, aes(x=V2, y=V3, group=BLOOD_CLAN_OR_MARK)) + 
  geom_point(aes(shape=ETHNOLINGUISTIC_GROUP, color=BLOOD_CLAN_OR_MARK)) + 
  scale_color_manual(values = unique.colors.all.clans, na.value = "grey") + 
  theme_classic() + 
  #theme(legend.position="top") +
  labs(x=axis_pc.a, y=axis_pc.b) + 
  #labs(color = "Clan Affiliation", shape = "Ethnolinguistic Group") + coord_cartesian(clip = "off")
  theme(legend.position = "none", axis.title.x = element_text(vjust=-0.5)) 

# plot
p1.bycclan <- ggplot(sample_info_merge, aes(x=V2, y=V3, group=CULTURAL_CLAN_OR_MARK)) +
  geom_point(aes(shape=ETHNOLINGUISTIC_GROUP, color=CULTURAL_CLAN_OR_MARK)) + 
  scale_color_manual(values = unique.colors.all.clans, na.value = "grey") + 
  theme_classic() +
  theme(legend.position="none") +
  labs(x=axis_pc.a, y=axis_pc.b) + 
  labs(color = "Clan Affiliation", shape = "Ethnolinguistic Group") + coord_cartesian(clip = "off")

# For legends
p1.bybclan.ld <- ggplot(sample_info_merge, aes(x=V2, y=V3, group=BLOOD_CLAN_OR_MARK)) + 
  geom_point(aes(shape=ETHNOLINGUISTIC_GROUP, color=BLOOD_CLAN_OR_MARK)) + 
  scale_color_manual(values = unique.colors.all.clans, na.value = "grey") + 
  theme_classic() +
  #theme(legend.position="top") +
  labs(x=axis_pc.a, y=axis_pc.b) + 
  labs(color = "Clan Affiliation", shape = "Ethnolinguistic Group") + coord_cartesian(clip = "off") +
  theme(legend.key.size=unit(1,"point")) +
  guides(col = guide_legend(ncol = 4,
                            title.position = "top"), 
         shape = guide_legend(ncol = 2,
                              title.position = "top"))

p1.bycclan.ld <- ggplot(sample_info_merge, aes(x=V2, y=V3, group=CULTURAL_CLAN_OR_MARK)) + 
  geom_point(aes(shape=ETHNOLINGUISTIC_GROUP, color=CULTURAL_CLAN_OR_MARK)) + 
  scale_color_manual(values = unique.colors.all.clans, na.value = "grey") + 
  theme_classic() +
  #theme(legend.position="top") +
  labs(x=axis_pc.a, y=axis_pc.b) + 
  labs(color = "Clan Affiliation", shape = "Ethnolinguistic Group") + coord_cartesian(clip = "off") +
  theme(legend.key.size=unit(1,"point")) +
  guides(col = guide_legend(ncol = 4,
                            title.position = "top"), 
         shape = guide_legend(ncol = 2,
                              title.position = "top"))

legend1 <- cowplot::get_legend(p1.bypop.ld)
legend2 <- cowplot::get_legend(p1.bybclan.ld)
legend3 <- cowplot::get_legend(p1.bycclan.ld)

grid.newpage()
grid.draw(legend1)
grid.newpage()
grid.draw(legend2)
grid.newpage()
grid.draw(legend3)
ggarrange(p1.bypop, p1.bybclan, p1.bycclan, 
          ncol = 3, labels = c("A", "B", "C"), nrow = 1)

dev.off()

#----------------------------------------------------------------------------------
# Plot set 7: PC 1 and 2 highlighting Turkana individuals blood, cultural clan 
# affiliation, and blood territorial section 
#----------------------------------------------------------------------------------