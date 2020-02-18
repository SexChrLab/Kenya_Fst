#!/usr/bin/env python3
import csv
import csv
import re
import sys
from optparse import  OptionParser

###############################################################################
USAGE = """
python fix_plink_missing_output.py	--infile <file and path to imiss file >
											--out <ID file name >
infile == file and path to imiss file
out == output file name
"""
parser = OptionParser(USAGE)
parser.add_option('--infile',dest='infile', help = ' file and path to imiss file ')
parser.add_option('--out',dest='out', help = ' output file name')

(options, args) = parser.parse_args()

parser = OptionParser(USAGE)
if options.infile is None:
	parser.error('path to all_bad_snp_chr_pos.txt not given')
if options.out is None:
	parser.error('output ID file name not given')
############################################################################

#infile = open("/home/amtarave/projects/genetic_diff_northern_kenya/QC/QC_01/melissa_wilson.95.snps.clean.b38.imiss","r")
#outfile = open("/home/amtarave/projects/genetic_diff_northern_kenya/QC/QC_01/melissa_wilson.95.snps.clean.b38.imiss.tab.sep", "w")
infile = open(options.infile,"r")
outfile = open(options.out, "w")

for line in infile:
	line = line.strip()
	line = line.split()
	newline =  line[0] + '\t' + line[1] + '\t' + line[2] + '\t' + line[3] + '\t' + line[4] + '\t' + line[5] + '\n'
	outfile.write(newline)

infile.close()
outfile.close()
