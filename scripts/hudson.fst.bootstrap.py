#!/usr/bin/env python3

# Angela Oill
# hudson.fst.bootstraps.py
# This script will perform a specified number of bootstraps and calculate Fst
# for 2 populations
import random
import numpy as np
import re
import sys
from optparse import  OptionParser

###############################################################################
USAGE = """
python hudson.fst.bootstraps.py	--frq <name of allele frequency file for 2 populations >
                                --nboot <number of bootstraps to do >
								--p1 <name of population 1 >
								--p2 < name of population 2 >
								--dir < out directory >

frq == name of allele frequency file for 2 populations
nboot == number of bootstraps to do
p1 == name of pop 1
p2 == name of pop 2
dir == output directory
"""

parser = OptionParser(USAGE)
parser.add_option('--frq',dest='frq', help = 'name of allele frequency file for 2 populations')
parser.add_option('--nboot',dest='nboot', help = 'number of bootstraps to do')
parser.add_option('--p1',dest='p1', help = 'name of pop 1')
parser.add_option('--p2',dest='p2', help = 'name of pop 2')
parser.add_option('--dir',dest='dir', help = 'name of out dir')

(options, args) = parser.parse_args()

parser = OptionParser(USAGE)
if options.frq is None:
	parser.error('frequency file name not given')
if options.nboot is None:
	parser.error('number of bootstraps not given')
if options.p1 is None:
	parser.error('population name 1 not give')
if options.p2 is None:
	parser.error('population name 2 not given')
if options.dir is None:
	parser.error('out directory not given')
############################################################################
# paste turkana.test.frq borana.test.frq > turkana.borana.test.merge.frq
#fn = "turkana.borana.test.merge.frq"
fn = options.frq

#bootn = 10
bootn = int(options.nboot)

#outfn = "turkana.borana.test.boot.fst.txt"
outfn1 = options.dir + options.p1 + "-" + options.p2 + ".Fst.bootstraps.txt"
out1 = open(outfn1, "w")
outfn2 = options.dir + options.p1 + "-" + options.p2 + ".Fst.bootstraps.avg.sd.95CI.txt"
out2 = open(outfn2, "w")


totfst = 0.0
fstvals = []
for i in range(1,(bootn+1)):
    with open(fn, 'r') as f:
        linesall = f.read().splitlines()
        # remove first line which is the header
        linesall2 = linesall[1:]
        n = len(linesall2)
        newlines = random.choices(linesall2, k=n)
        #print(n)
        #print (newlines)
        counter = 0
        sumnum = 0
        sumden = 0
        for l in newlines:
            lsplit = l.split()
            #print(lsplit[1],lsplit[7])
            # process pop 1 info
            p1 = lsplit[4]
            p1 = p1.split(":")
            p1 = float(p1[1]) # allele frequency for the particular site
            n1 = int(lsplit[3]) # number of chromosomes

            # process pop 2 info
            p2 = lsplit[10]
            p2 = p2.split(":")
            p2 = float(p2[1]) # allele frequency for the particular site
            n2 = int(lsplit[9]) # number of chromosomes

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
        #print(fst)
        totfst += fst
        fstvals.append(fst)
        printline = str(fst) + "\n"
        out1.write(printline)

# Calculate mean, se, and 95% CI
header = "mean\tstandard.error\t95%CI1\t95%CI2\n"
out2.write(header)

#print(fstvals)
avgbootfst = totfst/bootn
sebootfst = (np.std(fstvals, ddof = 1)) / (np.sqrt(bootn))
CIp = avgbootfst + (1.96 * sebootfst)
CIm = avgbootfst - (1.96 * sebootfst)

printline2 = str(avgbootfst) + "\t" + str(sebootfst) + "\t" + str(CIp) + "\t" + str(CIm) + "\n"
#print(printline2)
out2.write(printline2)


out1.close()
out2.close()
