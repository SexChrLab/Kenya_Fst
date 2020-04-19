#!/usr/bin/env python3
import random
import re
import sys
from optparse import  OptionParser

###############################################################################
USAGE = """
python subset.permutations.py	--fdir <path to original Fst combination lists >
											--outdir <Path to where the permutation fst sample files will be written >
                                            --fn <File name you wish to permute through >
                                            --numm <number of samples to grab that represents number of males in original calcularion >
                                            --numf <number of samples to grab that represents number of females in original calcularion >
                                            --nperm <number of permutations >
fdir == path to original Fst combination lists
outdir == Path to where the permutation fst sample files will be written
fn == File name you wish to permute through
numm == number of samples to grab that represents number of males in original calcularion
numf == number of samples to grab that represents number of females in original calcularion
nperm == number of permutations
"""
parser = OptionParser(USAGE)
parser.add_option('--fdir',dest='fdir', help = ' Path to where the permutation fst sample files will be written')
parser.add_option('--outdir',dest='outdir', help = ' Path to where the permutation fst sample files will be written')
parser.add_option('--fn',dest='fn', help = ' File name you wish to permute through')
parser.add_option('--numm',dest='numm', help = ' number of samples to grab that represents number of males in original calcularion')
parser.add_option('--numf',dest='numf', help = ' number of samples to grab that represents number of females in original calcularion')
parser.add_option('--nperm',dest='nperm', help = ' number permutations')

(options, args) = parser.parse_args()

parser = OptionParser(USAGE)
if options.fdir is None:
	parser.error('path to original Fst combination lists not given')
if options.outdir is None:
	parser.error('Path to where the permutation fst sample files will be written not given')
if options.fn is None:
	parser.error('File name you wish to permute through not given')
if options.numm is None:
	parser.error('number of samples to grab that represents number of males in original calcularion not given')
if options.numf is None:
	parser.error('number of samples to grab that represents number of females in original calcularion not given')
if options.nperm is None:
	parser.error('number of permutations not given')
############################################################################

# Variables
# Path to sample lists
#fdir = "/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/lists/fst_lists/"
fdir = options.fdir
# Path to where the permutation fst sample files will be written
#outdir = "/scratch/amtarave/genetic_diff_northern_kenya/00_New_analysis/06_fst_permutations/permutation_sample_lists/"
outdir = options.outdir

# File name you wish to permute through
#c1fn = "Lpisikishu.bloodClan.samburu.all.relatedsRemoved"
#c1fn = "Lukumai.bloodClan.samburu.all.relatedsRemoved"
c1fn = options.fn

# number to sample for each group. In this case number of males and females
#c1males = 12
#c1females = 7
#c1males = 9
#c1females = 7
c1males = options.numm
c1females = options.numf

# number of permutations
#nperm = 5
nperm = options.nperm

#l3 = [x for x in l1 if x not in l2]
outliers = ['24_54_al', '120_465', '48_195_al', '40_199_al']
# For each permutation, make a subsetted male list and subsetted female list
# do the random.shuffle() on the whole list. Pull the top 12 (number from c1males)
# for male list and remaining 7 (number from c1females) for female list
permtot = int(nperm)+1

for i in range(1,(permtot)):
    with open((fdir + c1fn)) as f:
        linesall = f.read().splitlines()
        #print (lines)
        lines = [x for x in linesall if x not in outliers] # this will remove the outliers from the original list prior to making permuted list
        
        random.shuffle(lines)

        #outfile_1 = outdir + c1fn + ".permutations.males." + str(i) + ".txt"
        #outfile_1 = outdir + c1fn + "/males/" + c1fn + ".permutations.males." + str(i) + ".txt"
        outfile_1 = outdir + c1fn + ".permutations.males." + str(i) + ".txt"
        outFile_1 = open(outfile_1, "w")

        #outfile_2 = outdir + c1fn + "/females/" + c1fn + ".permutations.females." + str(i) + ".txt"
        outfile_2 = outdir + c1fn + ".permutations.females." + str(i) + ".txt"
        outFile_2 = open(outfile_2, "w")

        males = lines[0:int(c1males)]
        females = lines[-int(c1females):]

        for line in males:
            newline_1 = line + "\n"
            outFile_1.write(newline_1)
        
        for line in females:
            newline_2 = line + "\n"
            outFile_2.write(newline_2)

print ("All done")
