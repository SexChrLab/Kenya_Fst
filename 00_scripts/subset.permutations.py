#!/usr/bin/env python3
import random
import re
import sys
from optparse import  OptionParser

###############################################################################
USAGE = """
python subset.permutations.py	--fdir <path to merged sample lists of the two groups to permute >
                                            --fn <File name you wish to permute through >
											--outdir <Path to where the permutation fst sample files will be written >
											--pop1 < name of population 1 >
											--pop2 < name of population 2 >
                                            --num1 <number of samples to grab that represents number of samples from population 1 in original calcularion >
                                            --num2 <number of samples to grab that represents number of samples from population 2 in original calcularion >
                                            --nperm <number of permutations >
fdir == path to merged sample lists of the two groups to permute
fn == File name you wish to permute through
outdir == Path to where the permutation fst sample files will be written
pop1 == name of population 1
pop2 == name of population 2
num1 == number of samples to grab that represents number of samples from population 1 in original calcularion
num2 == number of samples to grab that represents number of samples from population 2 in original calcularion
nperm == number of permutations
"""
parser = OptionParser(USAGE)
parser.add_option('--fdir',dest='fdir', help = ' Path to merged sample lists of the two groups to permute')
parser.add_option('--fn',dest='fn', help = ' File name you wish to permute through')
parser.add_option('--outdir',dest='outdir', help = ' Path to where the permutation fst sample files will be written')
parser.add_option('--pop1',dest='pop1', help = ' name of population 1')
parser.add_option('--pop2',dest='pop2', help = ' name of population 2 ')
parser.add_option('--num1',dest='num1', help = ' number of samples from population 1 in original calcularion')
parser.add_option('--num2',dest='num2', help = ' number of samples from population 2 in original calcularion')
parser.add_option('--nperm',dest='nperm', help = ' number permutations')

(options, args) = parser.parse_args()

parser = OptionParser(USAGE)
if options.fdir is None:
	parser.error('path to merged sample lists of the two groups to permute not given')
if options.fn is None:
	parser.error('File name you wish to permute through not given')
if options.outdir is None:
	parser.error('Path to where the permutation fst sample files will be written not given')
if options.pop1 is None:
	parser.error('name of population 1 not given')
if options.pop2 is None:
	parser.error('name of population 2 not given')
if options.num1 is None:
	parser.error('number of samples from population 1 in original calcularion not given')
if options.num2 is None:
	parser.error('number of samples from population 2 in original calcularion not given')
if options.nperm is None:
	parser.error('number of permutations not given')
############################################################################

# Variables
# Path to sample lists
fdir = options.fdir

# File name you wish to permute through
c1fn = options.fn

# Path to where the permutation fst sample files will be written
outdir = options.outdir

# number to sample for each group. In this case number of males and females
cpop1 = options.num1
cpop2 = options.num2

# number of permutations
nperm = options.nperm

# The sample lists have samples that were not included in the analysis. I have a
# list here with all samples that were removed in the manuscript. I will use this
# list to remove samples from the input list.
#l3 = [x for x in l1 if x not in l2]
smplsRemoved = ["24_54_al", "120_465", "48_195_al", "40_199_al", "89_305", "81_434", "73_347",
	"272_A82", "177_475", "376_370", "260_A69", "342_118", "77_299", "191_457",
	"96_Control_01946_1", "192_Control_01946_2", "288_Control_01946_3",
	"384_Control_01946_4", "240_Control_01946_5", "336_Control_01946_6",
	"307_8_al", "169_123_al", "105_384", "146_348_al", "280_A90", "377_407_al",
	"1_283", "49_312", "23_326", "20_330", "27_351", "137_374", "50_328", "56_313",
	"84_296", "58_322", "65_388", "117_310", "5_375", "30_286", "35_306", "85_336",
	"131_377", "164_360", "175_175_al", "22_258", "36_189", "157_211_al", "114_180",
	"61_240", "128_182", "150_179", "331_210", "359_279", "33_466", "34_491",
	"103_404_al", "109_469", "178_48_al", "335_82", "200_A8", "310_149", "94_18_al",
	"278_A88", "174_68", "195_A3", "199_A7", "209_A17", "324_80", "275_A85",
	"207_A15", "274_A84", "190_131", "95_145", "300_52_al", "151_102", "167_113",
	"173_130_al", "315_64", "185_30", "188_129", "202_A10", "213_A22", "217_A26",
	"229_A38", "227_A36", "2_386"]

# For each permutation, make a subsetted lists for population 1 and 2
# Do the random.shuffle() on the whole list. Pull the top xx (number from cpop1)
# for list 1 and remaining xx (number from cpop2) for list 2
permtot = int(nperm)+1

for i in range(1,(permtot)):
	with open((fdir + c1fn)) as f:
		linesall = f.read().splitlines()
		#print (lines)
		lines = [x for x in linesall if x not in smplsRemoved] # this will remove the samples that were removed from the original list prior to making permuted list

		random.shuffle(lines)
		outfile_1 = outdir + str(options.pop1) + ".permutation." + str(i) + ".txt"
		outFile_1 = open(outfile_1, "w")
		outfile_2 = outdir + str(options.pop2) + ".permutation." + str(i) + ".txt"
		outFile_2 = open(outfile_2, "w")

		pop1 = lines[0:int(cpop1)]
		pop2 = lines[-int(cpop2):]

		for line in pop1:
			newline_1 = line + "\n"
			outFile_1.write(newline_1)

		for line in pop2:
			newline_2 = line + "\n"
			outFile_2.write(newline_2)

print ("All done")
