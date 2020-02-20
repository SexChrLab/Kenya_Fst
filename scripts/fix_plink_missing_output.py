#!/usr/bin/env python3
import csv
import csv
import re
import sys
from optparse import  OptionParser

###############################################################################
USAGE = """
python fix_plink_missing_output.py	--imissfl <file and path to imiss file >
											--lmissfl <file and path to lmiss file >
											--imissout <ID file name imiss >
											--lmissout <ID file name lmiss >
imissfl == file and path to imiss file
lmissfl == file and path to lmiss file
imissout == output file name imiss
lmissout == output file name lmiss
"""
parser = OptionParser(USAGE)
parser.add_option('--imissfl',dest='imissfl', help = ' file and path to imiss file ')
parser.add_option('--lmissfl',dest='lmissfl', help = ' file and path to lmiss file ')
parser.add_option('--imissout',dest='imissout', help = ' output file name imiss')
parser.add_option('--lmissout',dest='lmissout', help = ' output file name lmiss')

(options, args) = parser.parse_args()

parser = OptionParser(USAGE)
if options.imissfl is None:
	parser.error('path to imiss file not given')
if options.lmissfl is None:
	parser.error('path to lmiss file not given')
if options.imissout is None:
	parser.error('output imiss file name not given')
if options.lmissout is None:
	parser.error('output lmiss file name not given')
############################################################################

#infile = open("/home/amtarave/projects/genetic_diff_northern_kenya/QC/QC_01/melissa_wilson.95.snps.clean.b38.imiss","r")
#outfile = open("/home/amtarave/projects/genetic_diff_northern_kenya/QC/QC_01/melissa_wilson.95.snps.clean.b38.imiss.tab.sep", "w")
infilei = open(options.imissfl,"r")
outfilei = open(options.imissout, "w")

infilel = open(options.lmissfl,"r")
outfilel = open(options.lmissout, "w")

for line in infilei:
	line = line.strip()
	line = line.split()
	newline =  line[0] + '\t' + line[1] + '\t' + line[2] + '\t' + line[3] + '\t' + line[4] + '\t' + line[5] + '\n'
	outfilei.write(newline)

infilei.close()
outfilei.close()

for line in infilel:
	line = line.strip()
	line = line.split()
	newline =  line[0] + '\t' + line[1] + '\t' + line[2] + '\t' + line[3] + '\t' + line[4] + '\n'
	outfilel.write(newline)

infilel.close()
outfilel.close()
