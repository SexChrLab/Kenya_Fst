#!/usr/bin/env python3
# Angela Oill
# calc.geo.dist.py
# This script will calculate geographic distances between populations given
# a set of lat and long coordinates
import math
import re
import sys
from optparse import  OptionParser

###############################################################################
USAGE = """
python calc.geo.dist.py	--l1 <name of lat and long file for pop 1 >
                                --l2 <name of lat and long file for pop 2 >
								--p1 <name of population 1 >
								--p2 < name of population 2 >
								--dir < out directory >

l1 == name of lat and long file for pop 1
l2 == name of lat and long file for pop 2
p1 == name of pop 1
p2 == name of pop 2
dir == output directory
"""

parser = OptionParser(USAGE)
parser.add_option('--l1',dest='l1', help = 'name of lat and long file for pop 1')
parser.add_option('--l2',dest='l2', help = 'name of lat and long file for pop 2')
parser.add_option('--p1',dest='p1', help = 'name of pop 1')
parser.add_option('--p2',dest='p2', help = 'name of pop 2')
parser.add_option('--dir',dest='dir', help = 'name of out dir')

(options, args) = parser.parse_args()

parser = OptionParser(USAGE)
if options.l1 is None:
	parser.error('coordinates for pop 1 not given')
if options.l2 is None:
	parser.error('coordinates for pop 1 not given')
if options.p1 is None:
	parser.error('population name 1 not give')
if options.p2 is None:
	parser.error('population name 2 not given')
if options.dir is None:
	parser.error('out directory not given')
############################################################################
infn1 = options.l1
infn2 = options.l2
infile1 = open(options.l1, "r")
infile2 = open(options.l2, "r")

outfn1 = options.dir + options.p1 + "_" + options.p2 + ".distances.txt"
outfn2 = options.dir + options.p1 + "_" + options.p2 + ".distances.averaged.txt"
outfile1 = open(outfn1, "w")
outfile2 = open(outfn2, "w")

dsum = 0 # sum of all distances (d)
combos = 0 # number of calculations of d
for line1 in infile1:
    if "LATITUDE" in line1: # skip header
		continue
    else:
        # process population 1 information
        line1 = line1.split()
        # get value for LATITUDE and LONGITUDE for first file
        lat1 = float(line1[0])
        lon1 = float(line1[1])
    for line2 in infile2:
        if "LATITUDE" in line2: # skip header
            continue
        else:
            combos += 1
            line2 = line2.split()
            # get value for LATITUDE and LONGITUDE for second file
            lat2 = float(line2[0])
            lon2 = float(line2[1])

            dlon = lon2 - lon1
            dlat = lat2 - lat1

            # This below that is commented does not work
            #a = ((math.sin((dlat/2)))**2) + ((math.cos(lat1)) * (math.cos(lat2)) * (math.sin((dlon/2))**2))
            #c = 2 * (math.atan2( math.sqrt(a), math.sqrt((1-a)) )) # so this val in radians
            #d = 6371 * c

            # Correct d calculation
            d = math.acos(math.cos(math.radians(90-lat1)) * math.cos(math.radians(90-lat2)) + math.sin(math.radians(90-lat1)) * math.sin(math.radians(90-lat2)) * math.cos(math.radians(lon1-lon2))) * 6371
            dsum += d

            outfile1.write(str(d))
            outfile1.write("\n")

avgd = dsum/combos
linetow = options.p1 + "\t" + options.p2 + "\t" + str(avgd) + "\n"
outfile2.write(linetow)


infile1.close()
infile2.close()
outfile1.close()
outfile2.close()
