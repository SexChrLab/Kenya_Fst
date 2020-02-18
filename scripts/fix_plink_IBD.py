#!/usr/bin/env python3
import csv
import csv
import re
import sys
from optparse import  OptionParser

###############################################################################
USAGE = """
python fix_plink_ycount.py	--infile <file and path to genome file >
											--out <out file name >
infile == file and path to ycount file
out == output file name
"""
parser = OptionParser(USAGE)
parser.add_option('--infile',dest='infile', help = ' file and path to genome file ')
parser.add_option('--out',dest='out', help = ' output file name')

(options, args) = parser.parse_args()

parser = OptionParser(USAGE)
if options.infile is None:
	parser.error('path to genome file not given')
if options.out is None:
	parser.error('output file name not given')
############################################################################

infile = open(options.infile,"r")
outfile = open(options.out, "w")

for line in infile:
	line = line.strip()
	line = line.split()
	newline =  line[0] + '\t' + line[1] + '\t' + line[2] + '\t' + line[3] + '\t' + line[4] + '\t' + line[5] + '\t' + line[6] + '\t' + line[7] + '\t' + line[8] + '\t' + line[9] + '\t' + line[10] + '\t' + line[11] + '\t' + line[12] + '\t' + line[13] + '\n'

	outfile.write(newline)

infile.close()
outfile.close()
