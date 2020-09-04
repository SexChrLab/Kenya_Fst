#!/usr/bin/env python3

"""
This script will take as input 2 files: 1) a bim or map file and 2) a list of chr and pos
and will output a file with snp IDs that match with the chr and pos in input 2 BUT only
if the alleles do not match across the IDs with the same chr and position.


I am having a problem outputting the IDs buttttt I could just output the chr and pos and
then run match_chr_pos_get_IDs.py
"""

# Notes to self:
# a is the duplicated site list (all chr and pos where there are multiple IDs)
# file_2 is the full bim file. It has allele 1 and allele 2 in cols 4 and 5

import csv
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

# Store the file names to a vector so that we can call them later when needed
#file1 = "pos_with_more_than_one_snpID.txt"
#file2 = "/home/amtarave/projects/genetic_diff_northern_kenya/plink_files/noIndels/melissa_wilson.raw.reorder.noChr0.noIndels.SNPsOnly.binary.bim"

# This will be the output file name and we are writing to this file so we need "w"
outfile = open(options.out, "w") # we want to output a new list with old ID \t new ID



with open(options.badpos, "r") as infile1:
		file_to_compare_1 = list(csv.reader(infile1, delimiter='\t'))


counter = 0
#a_number = 0 # site number counter, just to keep track
for a in file_to_compare_1:
	#a_number += 1

	# this will have the map file start fromt the beginning every time we go through one
	# entry in the bad dup site file
	file_to_compare_2 = csv.reader(open(options.mapbim, "r"), delimiter='\t')
	file_2 = next(file_to_compare_2)

	allele1 = ""
	allele2 = ""
	allele1_c = ""
	allele2_c = ""
	# This while loop just finds the correct position of interest
	same_site = False
	while not same_site:
		try:
			if a[0] == file_2[0] and a[1] == file_2[3]: # if chr and pos are the same between both files.
				same_site = True

			else:
				same_site = False
				file_2 = next(file_to_compare_2)
		except StopIteration:
			break

	# This while loop actually does the work
	#counter = 0
	# I think the allele variables will go here
	#allele1 = ""
	#allele2 = ""
	#allele1_c = ""
	#allele2_c = ""
	while a[0] == file_2[0] and a[1] == file_2[3]:
		#counter += 1
		allele1 = file_2[4]
		allele2 = file_2[5]
		#id1 = file_2[1]

		if allele1_c == "" and allele2_c == "":
			allele1_c = allele1
			allele2_c = allele2

		#print(file_2)
		#print(allele1, allele2)
		#print(allele1_c, allele2_c)

		if allele1 != allele1_c or allele2 != allele2_c:
			counter += 1
			#print("missmatch", counter)
			#print(file_2)
			#print(file_2[0], file_2[3])
			line_to_print = file_2[0] + '\t' + file_2[3] + '\n'
			#print(line_to_print)
			outfile.write(line_to_print)
			#print(id1)
			#print(file_2[1]) # this is the last variant. I need a way of getting all in set

		#print(counter)
		#id = file_2[1] + '\n'
		#print(file_2[1])
		#outfile.write(id)

		try:
			file_2 = next(file_to_compare_2)
		except StopIteration:
			break

print("There were a total of", counter, " missmatches")
outfile.close()
