# Angela Taravella
# hudson.fst.py
# This script will calculate Fst for 2 populations
import math
import re
import sys
from optparse import  OptionParser

###############################################################################
USAGE = """
python hudson.fst.py	--frq1 <name of allele frequency file for population 1 >
								--frq2 <name of allele frequency file for populaiton 2>
								--p1 <name of population 1 >
								--p2 < name of population 2 >
								--out < out name and path >

frq1 == name of allele frequency file for population 1
frq2 == name of allele frequency file for population 2
p1 == name of pop 1
p2 == name of pop 2
out == output path and name
"""

parser = OptionParser(USAGE)
parser.add_option('--frq1',dest='frq1', help = 'name of allele frequency file for population 1')
parser.add_option('--frq2',dest='frq2', help = 'name of allele frequency file for population 2')
parser.add_option('--p1',dest='p1', help = 'name of pop 1')
parser.add_option('--p2',dest='p2', help = 'name of pop 2')
parser.add_option('--out',dest='out', help = 'name of out path and name')
#parser.add_option('--chr',dest='chr', help = 'chromosomes analyzed (i.e. 1-22 or 23)')
#parser.add_option('--sex',dest='sex', help = 'sexes analyzed (i.e. all, males, females)')

(options, args) = parser.parse_args()

parser = OptionParser(USAGE)
if options.frq1 is None:
	parser.error('frequency file name for pop 1 not given')
if options.frq2 is None:
	parser.error('frequency file name for pop 2 not given')
if options.p1 is None:
	parser.error('population name 1 not give')
if options.p2 is None:
	parser.error('population name 2 not given')
if options.out is None:
	parser.error('out path and name not given')
#if options.chr is None:
#	parser.error('chromosome numbers not provided')
#if options.sex is None:
#	parser.error('sex not provided')
############################################################################
"""
# Instead of merging the 2 freq files, I want to have both be input and iterate
# through both at the same time.
with open(file1name) as file1, open(file2name) as file2:
    for line1, line2 in zip(file1, file2):
        #do stuff
"""

freqfile1 = open(options.frq1, "r")
freqfile2 = open(options.frq2, "r")
#OutFileName = options.p1 + "." + options.p2 + ".chr." + options.chr + "." + options.sex + ".Fst.table.txt"
#OutFileName = options.dir + options.p1 + "-" + options.p2 + ".Fst.table.txt"
OutFileName = options.out 
OutFile = open(OutFileName, "w")

counter = 0
sumnum = 0
sumden = 0
#for line in freqfile:
for line1, line2 in zip(freqfile1, freqfile2):
	if "CHROM" in line1 and "CHROM" in line2:
		continue
	else:
		# process population 1 information
		line1 = line1.split()
		p1 = line1[4]
		p1 = p1.split(":")
		p1 = float(p1[1]) # alt allele frequency for the particular site
		n1 = int(line1[3]) # number of chromosomes

		# Process population 2 information
		line2 = line2.split()
		p2 = line2[4]
		p2 = p2.split(":")
		p2 = float(p2[1]) # alt allele frequency for the particular site
		n2 = int(line2[3]) # number of chromosomes

		# make sure everything worked
		#print(line1)
		#print(p1)
		#print(n1)
		#print(line2)
		#print(p2)
		#print(n2)

		# Store numorator and denominator separately since I'll be doing average
		# of ratios Fst
		numorator = ((p1-p2)*(p1-p2)) - ((p1*(1-p1))/(n1-1)) - ((p2*(1-p2))/(n2-1))
		denominator = (p1*(1-p2)) + (p2*(1-p1))

		# I will exclude sites where denominator is 0
		if denominator == 0:
			continue
		else:
			ratiofst = numorator/denominator

			sumnum += numorator
			sumden += denominator
			counter += 1

fst = (sumnum/counter)/(sumden/counter) # average of ratios fst

# write out results to text file
#header = "Pop1\tPop2\tN1\tN2\tSites\tFst\n"
#OutFile.write(header)

#linetowrite = options.p1 + "\t" + options.p2 + "\t" + str(n1) + "\t" + str(n2) + "\t" + str(counter) + "\t" + str(fst) + "\n"
linetowrite = options.p1 + "\t" + options.p2 + "\t" + str(counter) + "\t" + str(fst) + "\n"
OutFile.write(linetowrite)


freqfile1.close()
freqfile2.close()
OutFile.close()
