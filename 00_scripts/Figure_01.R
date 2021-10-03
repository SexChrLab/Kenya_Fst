#!/usr/bin/Rscript
# Author: Angela Taravella Oill
# ___usage___
# Rscript figure.01.R <gps_points_file> <sample_info_file> <pca_path_and_stem_name> <path_to_intermarriage_rate_files> <output_path_and_file_name>

# Description:
# This script will make the main figure 1 plot for the manuscript.
# Figure 1 will have three panels. A) Map, B) PCA, C) intermarriage rate bar 
# plots. A and B will be on the left and C will be on the right.

#--------------------#
### LOAD LIBRARIES ###
#--------------------#
library(ggplot2)
library(tidyr)
library(ggpubr)
library(gridExtra)
library(grid)
library("sf")
library("rnaturalearth")
library("rnaturalearthdata")
library(cowplot)
library(rgeos)

#---------------------------#
### SET UP COMMAND INPUTS ###
#---------------------------#
args = commandArgs(trailingOnly=TRUE)
mapinfo = args[1]
smpl = args[2]
inname = args[3]
marriagepth = args[4]
outname = args[5]


#-------------------------------#
### READ IN DATA FOR PLOTTING ###
#-------------------------------#
map_points <- read.table(mapinfo, sep = "\t", header = T)
sample_file <- read.csv(smpl, sep = ",", header = T)
evec <- read.table(paste(inname,".evec.fix", sep=""), header = F)
eval <- read.table(paste(inname,".eval", sep=""), header = F)

b.males.fn <- paste(marriagepth, "Borana_males_all.txt", sep = "")
b.females.fn <- paste(marriagepth, "Borana_females_all.txt", sep = "")
r.males.fn <- paste(marriagepth, "Rendille_males_all.txt", sep = "")
r.females.fn <- paste(marriagepth, "Rendille_females_all.txt", sep = "")
s.males.fn <- paste(marriagepth, "Samburu_males_all.txt", sep = "")
s.females.fn <- paste(marriagepth, "Samburu_females_all.txt", sep = "")
t.males.fn <- paste(marriagepth, "Turkana_males_all.txt", sep = "")
t.females.fn <- paste(marriagepth, "Turkana_females_all.txt", sep = "")


#--------------------------------#
### COMBINE FILES FOR PLOTTING ###
#--------------------------------#
sample_info_merge <- merge(sample_file, evec, by.x = "IID", by.y = "V1")


#----------#
### PLOT ###
#----------#
pdf(outname, width = 8, height = 8)

#############
# Figure 1A #
#############
# Make Map
# Set colors for map
pop.colors <- c( "Turkana" = "#66CC99", "Samburu" = "#CC6699", "Rendille" = "#CC9933", "Borana" = "#660066")

# Make world data frame
world <- ne_countries(scale = "medium", returnclass = "sf") 
class(world)

fig1a <- ggplot(data = world) +
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
  #labs(color = "Ethnolinguistic Group", shape = "Territorial Section") + 
  #guides(col = guide_legend(ncol = 2, override.aes = list(size = 2),
  #                          title.position = "top"), 
  #       shape = guide_legend(ncol = 3, override.aes = list(size = 2),
  #                            title.position = "top")) +
  theme(text = element_text(size=18),
        plot.background = element_rect(fill = "white"),
        panel.background = element_rect(fill = "lightblue"),
        axis.line.x = element_line(color = "grey"),
        legend.position = "none",
        axis.text.x = element_text(angle = 45, hjust = 1)
  ) 



#############
# Figure 1B #
#############
# Make PCA
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

# By pop and Turkana TS
fig1b <- ggplot(sample_info_merge, aes(x=V2, y=V3, color=ETHNOLINGUISTIC_GROUP_FOR_PLOTTING, shape = BLOOD_TERRITORIAL_SECTION_FOR_PLOTTING)) + 
  geom_point(size = 2.5) + 
  scale_color_manual(values = pop.colors) + 
  theme_classic() + 
  labs(x=axis_pc.a, y=axis_pc.b) + 
  #scale_shape_manual(values=c(3, 1, 16, 2, 1, 1, 1, 1, 0)) +
  labs(color = "Ethnolinguistic Group", shape = "Territorial Section") +
  guides(col = guide_legend(ncol = 2, override.aes = list(size = 2),
                            title.position = "top"), 
         shape = guide_legend(ncol = 2, override.aes = list(size = 2),
                              title.position = "top")) +
  scale_shape_manual(values=ts.shapes) +
  theme(text = element_text(size=14), 
        legend.position = "bottom"
        # , legend.title=element_text(size=10),
        #legend.text=element_text(size=8)
  )



#############
# Figure 1C #
#############
# Make intermarriage plots

#--------#
# BORANA #
#--------#
b.males <- read.table(b.males.fn, sep = "\t",
                      header = T)
b.females <- read.table(b.females.fn, sep = "\t",
                        header = T)

num.males.marriages <- nrow(b.males)
num.females.marriages <- nrow(b.females)
num.males <- length(levels(as.factor(b.males$Subject_ID)))
num.females <- length(levels(as.factor(b.females$Subject_ID)))

b.dat <- rbind(b.males, b.females)
df <- as.data.frame(b.dat)

# Modify the data
lab.male <- paste("Men\n(marriages = ", num.males.marriages, "; n = ", num.males, ")", sep = "")
lab.female <- paste("Women\n(marriages = ", num.females.marriages, "; n = ", num.females, ")", sep = "")

df$Subject_Sex <- factor(df$Subject_Sex, levels = c("FEMALE", "MALE"), 
                         labels = c(lab.female, lab.male))

#-----------#
# RENDILLE #
#-----------#
r.males <- read.table(r.males.fn, sep = "\t",
                      header = T)
r.females <- read.table(r.females.fn, sep = "\t",
                        header = T)

num.males.marriages <- nrow(r.males)
num.females.marriages <- nrow(r.females)
num.males <- length(levels(as.factor(r.males$Subject_ID)))
num.females <- length(levels(as.factor(r.females$Subject_ID)))

r.dat <- rbind(r.males, r.females)
df.2 <- as.data.frame(r.dat)

# Modify the data
lab.male <- paste("Men\n(marriages = ", num.males.marriages, "; n = ", num.males, ")", sep = "")
lab.female <- paste("Women\n(marriages = ", num.females.marriages, "; n = ", num.females, ")", sep = "")

df.2$Subject_Sex <- factor(df.2$Subject_Sex, levels = c("FEMALE", "MALE"), 
                           labels = c(lab.female, lab.male))

drops <- c("Notes")
df.2.edit <- df.2[ , !(names(df.2) %in% drops)]


#---------#
# SAMBURU #
#---------#
s.males <- read.table(s.males.fn, sep = "\t",
                      header = T)
s.females <- read.table(s.females.fn, sep = "\t",
                        header = T)

num.males.marriages <- nrow(s.males)
num.females.marriages <- nrow(s.females)
num.males <- length(levels(as.factor(s.males$Subject_ID)))
num.females <- length(levels(as.factor(s.females$Subject_ID)))

s.dat <- rbind(s.males, s.females)

df.3 <- as.data.frame(s.dat)

# Modify the data
lab.male <- paste("Men\n(marriages = ", num.males.marriages, "; n = ", num.males, ")", sep = "")
lab.female <- paste("Women\n(marriages = ", num.females.marriages, "; n = ", num.females, ")", sep = "")

df.3$Subject_Sex <- factor(df.3$Subject_Sex, levels = c("FEMALE", "MALE"), 
                           labels = c(lab.female, lab.male))
drops <- c("Notes")
df.3.edit <- df.3[ , !(names(df.3) %in% drops)]


#---------#
# TURKANA #
#---------#
t.males <- read.table(t.males.fn, sep = "\t",
                      header = T)
t.females <- read.table(t.females.fn, sep = "\t",
                        header = T)

num.males.marriages <- nrow(t.males)
num.females.marriages <- nrow(t.females)
num.males <- length(levels(as.factor(t.males$Subject_ID)))
num.females <- length(levels(as.factor(t.females$Subject_ID)))

t.dat <- rbind(t.males, t.females)

df.4 <- as.data.frame(t.dat)

# Modify the data
lab.male <- paste("Men\n(marriages = ", num.males.marriages, "; n = ", num.males, ")", sep = "")
lab.female <- paste("Women\n(marriages = ", num.females.marriages, "; n = ", num.females, ")", sep = "")

df.4$Subject_Sex <- factor(df.4$Subject_Sex, levels = c("FEMALE", "MALE"), 
                           labels = c(lab.female, lab.male))

drops <- c("Subject_ID_dat", "SUBJECT_ID_SPIT", "Subject_TERRITORIAL_BIRTH", 
           "Subject_MARK", "MARITAL_STATUS", "SPOUSE_TERRITORIAL", "SPOUSE_MARK",
           "Notes")
df.4.edit <- df.4[ , !(names(df.4) %in% drops)]

colnames(df.4.edit) <- c(
  "Subject_ID", "Index", "Subject_Sex", "Subject_Ethnic_Group_Born",
  "SPOUSE_ETHNIC", "SPOUSE_OTHER", "SPOUSE_CLAN_OTHER",  "Across_Ethnic_Group_Y_N",
  "Outside_Ethnic_Group", "Study_Type_FST1_FST2", "For_plotting"
)


#----------------------------#
# Prep all data for plotting #
#----------------------------#
df.all <- rbind(df, df.2.edit, df.3.edit, df.4.edit)

df.all$For_plotting <- as.factor(df.all$For_plotting)
b.data <- df.all[df.all$Subject_Ethnic_Group_Born =="BORANA", ]
r.data <- df.all[df.all$Subject_Ethnic_Group_Born =="RENDILLE", ]
s.data <- df.all[df.all$Subject_Ethnic_Group_Born =="SAMBURU", ]
t.data <- df.all[df.all$Subject_Ethnic_Group_Born =="TURKANA", ]

b.data$For_plotting <- factor(b.data$For_plotting, 
                              levels = c("Borana", "Rendille", "Samburu", "Turkana", 
                                         "Gabra", "Garri", "Lturuya", "Meru", "Sakuye", 
                                         "Somali"))
r.data$For_plotting <- factor(r.data$For_plotting, 
                              levels = c("Borana", "Rendille", "Samburu", "Turkana", 
                                         "Gabra", "Garri", "Lturuya", "Meru", "Sakuye", 
                                         "Somali"))
s.data$For_plotting <- factor(s.data$For_plotting, 
                              levels = c("Borana", "Rendille", "Samburu", "Turkana", 
                                         "Gabra", "Garri", "Lturuya", "Meru", "Sakuye", 
                                         "Somali"))
t.data$For_plotting <- factor(t.data$For_plotting, 
                              levels = c("Borana", "Rendille", "Samburu", "Turkana", 
                                         "Gabra", "Garri", "Lturuya", "Meru", "Sakuye", 
                                         "Somali"))


#------#
# PLOT #
#------#
borana <- ggplot(b.data, aes(as.factor(For_plotting), group = Subject_Sex)) + 
  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + 
  scale_x_discrete(drop = FALSE) +
  scale_y_continuous(labels=scales::percent, limits = c(0,1)) +
  ylab("% of marriages") +  xlab("Spouse ethnic group") +
  facet_grid(~Subject_Sex) + 
  theme_cowplot() +
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1)
  ) + ggtitle("Borana") + 
  scale_fill_manual(values = c(
    #"#660066", "blue", "green", "orange", "purple"
    "#660066", "chartreuse4", "dodgerblue1", "coral3", "palegoldenrod"
  ))

rendille <- ggplot(r.data, aes(as.factor(For_plotting), group = Subject_Sex)) + 
  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + 
  scale_x_discrete(drop = FALSE) +
  scale_y_continuous(labels=scales::percent, limits = c(0,1)) +
  ylab("% of marriages") +  xlab("Spouse ethnic group") +
  facet_grid(~Subject_Sex) + 
  theme_cowplot() +
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1)
  ) + ggtitle("Rendille") +
  scale_fill_manual(values = c(
    "#CC9933", "#CC6699"
  ))

samburu <- ggplot(s.data, aes(as.factor(For_plotting), group = Subject_Sex)) + 
  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + 
  scale_x_discrete(drop = FALSE) +
  scale_y_continuous(labels=scales::percent, limits = c(0,1)) +
  ylab("% of marriages") +  xlab("Spouse ethnic group") +
  facet_grid(~Subject_Sex) + 
  theme_cowplot() +
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1)
  ) + ggtitle("Samburu") +
  scale_fill_manual(values = c(
    "#CC9933", "#CC6699", "#66CC99",
    "lightcyan3", "red3"
  ))

turkana <- ggplot(t.data, aes(as.factor(For_plotting), group = Subject_Sex)) + 
  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + 
  scale_x_discrete(drop = FALSE) +
  scale_y_continuous(labels=scales::percent, limits = c(0,1)) +
  ylab("% of marriages") +  xlab("Spouse ethnic group") +
  facet_grid(~Subject_Sex) + 
  theme_cowplot() +
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1)
  ) + ggtitle("Turkana") +
  scale_fill_manual(values = c(
    "#66CC99"
  ))


# Place together on one plot
gt <- grid.arrange(
  arrangeGrob(fig1a, fig1b, nrow = 2), 
  ggarrange(borana, rendille, samburu, turkana,
            ncol = 1, nrow = 4, align="hv"),
  ncol = 2,
  widths = c(1, 1.25))

pdf(outname, height = 11, width = 9.6)

as_ggplot(gt) +                                # transform to a ggplot
  draw_plot_label(label = c("A", "B", "C"), size = 15,
                  x = c(0, 0, 0.5), y = c(1, 0.5, 1)) # Add labels
dev.off()

