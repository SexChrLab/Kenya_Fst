# make_par.py
# Makes parameters file for smartpca

import re
import sys
from optparse import  OptionParser

###############################################################################
USAGE = """
python make_par.py	--map <name of map, with full directory >
								--ped <name of ped, with full directory >
								--evec < eginvector file name, with full directory >
                                --eval < eginvalue file name, with full directory >
                                --log < outlier log file name with full directory >
								--par < parameter file name, with full directory >
map == file name of map
ped == file name of ped
evec == file name of eigenvector file
eval == file name of eigenvalue file
log == file name of outlier file
par == parameter file name
"""

parser = OptionParser(USAGE)
parser.add_option('--map',dest='map', help = ' map file needing to go into analysis')
parser.add_option('--ped',dest='ped', help = 'ped file needing to go into analysis')
parser.add_option('--evec',dest='evec', help = 'output name for egienvector file')
parser.add_option('--eval',dest='eval', help = 'output name for egienvector file')
#parser.add_option('--log',dest='log', help = 'output name for outlier file')
parser.add_option('--par',dest='par', help = 'output name for parameter file')

(options, args) = parser.parse_args()

parser = OptionParser(USAGE)
if options.map is None:
	parser.error('map file name not given')
if options.ped is None:
	parser.error('ped file name not given')
if options.evec is None:
	parser.error('egienvector file name not given')
if options.eval is None:
	parser.error('egienvalue file name not given')
#if options.log is None:
#	parser.error('outlier file name not given')
if options.par is None:
	parser.error('par file name not given')
############################################################################


Outfile = options.par
OutFile = open(Outfile, 'w')

gename = 'genotypename: ' + options.ped + ' '
snpname = 'snpname: ' + options.map + ' '
indname = 'indivname: ' + options.ped + ' '
evec = 'evecoutname: ' + options.evec + ' '
eval = 'evaloutname: ' + options.eval + ' '
#outlier = 'outlieroutname: ' + options.log + ' '
options = 'altnormstyle: NO ' + '\n' + 'familynames: NO ' + '\n' + 'numchrom: 23 ' + '\n' + 'noxdata: NO ' + '\n' + 'numoutlieriter: 0' + '\n'

#OutFile.write('%s\n%s\n%s\n%s\n%s\n%s\n%s\n' % (gename, snpname, indname, evec, eval, outlier, options))
OutFile.write('%s\n%s\n%s\n%s\n%s\n%s\n' % (gename, snpname, indname, evec, eval, options))

OutFile.close()
