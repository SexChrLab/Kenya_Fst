#!/usr/bin/env python3

"""
This script will take as input 2 files: 1) a bim or map file and 2) a list of chr and pos
and will output a file with snp IDs that match with the chr and pos in input 2.
"""
import csv
import re
import sys
from optparse import  OptionParser

###############################################################################
USAGE = """
python make_merge_list_auto.py	--badpos <path to all_bad_snp_chr_pos.txt >
											--mapbim <map file of no Indels plink file can be bim also>
											--out <ID file name >
badpos == path to all_bad_snp_chr_pos.txt
mapbim == map file of no Indels plink file can be bim also
out == output ID file name
"""
parser = OptionParser(USAGE)
parser.add_option('--badpos',dest='badpos', help = ' path to all_bad_snp_chr_pos.txt ')
parser.add_option('--mapbim',dest='mapbim', help = ' map file of no Indels plink file can be bim also')
parser.add_option('--out',dest='out', help = ' output ID file name')

(options, args) = parser.parse_args()

parser = OptionParser(USAGE)
if options.badpos is None:
	parser.error('path to all_bad_snp_chr_pos.txt not given')
if options.mapbim is None:
	parser.error('comap file of no Indels plink file not given')
if options.out is None:
	parser.error('output ID file name not given')
############################################################################

#file1 = "all_bad_snp_chr_pos.txt"
#file2 = "/home/amtarave/projects/genetic_diff_northern_kenya/plink_files/noIndels/melissa_wilson.raw.reorder.noChr0.noIndels.SNPsOnly.map"

outfile = open(options.out, "w") # we want to output a new list with old ID \t new ID

with open(options.badpos, "r") as infile1:
		file_to_compare_1 = list(csv.reader(infile1, delimiter='\t'))

#a_number = 0 # site number counter, just to keep track
for a in file_to_compare_1:
	#a_number += 1
	#print(a)

	# this will have the map file start fromt the beginning every time we go through one
	# entry in the bad dup site file
	file_to_compare_2 = csv.reader(open(options.mapbim, "r"), delimiter='\t')
	file_2 = next(file_to_compare_2)
	#print(file_2)


	same_site = False
	while not same_site:
		try:
			if a[0] == file_2[0] and a[1] == file_2[3]:
				same_site = True

			else:
				same_site = False
				file_2 = next(file_to_compare_2)
		except StopIteration:
			break
	#counter = 0
	while a[0] == file_2[0] and a[1] == file_2[3]:
		#counter += 1

		#print(counter)
		id = file_2[1] + '\n'
		#print(file_2[1])
		outfile.write(id)

		try:
			file_2 = next(file_to_compare_2)
		except StopIteration:
			break


outfile.close()
