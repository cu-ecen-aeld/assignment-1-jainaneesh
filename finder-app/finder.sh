#!/usr/bin/bash

########################################################################################################
#
#	Author : Aneesh Jain
#	Topic  : Assignment1 - finder.sh
#
########################################################################################################


filesdir=$1			# Passing the first argument - path of directory to filesdir
searchstr=$2			# Passing the second argument - string to be searched
				

########################################################################################################
#
# This if statement will check for the arguments passed to this script in the order 1, 2 and will exit 
# if the required number of arguments were not given.
#
########################################################################################################
if [ $# -lt 2 ];
then
	echo -e "Either filesdir or searchdir was not specified"
	echo -e "This script takes two(2) arguments:"
	echo -e "1) Directory on the file system"
	echo -e "2) String to be searched through the file system"
	exit 1
fi


########################################################################################################
#
# This if statement will check for the existence of directory passed to this scripts.
#
########################################################################################################

if [ ! -d "$filesdir" ];then
	echo -e "Could not find directory $1"
	exit 1
fi

filepath=${filesdir%/*}
basename=${filesdir##*/}



#touch $basename 2>/dev/null
matchingstr=`grep -rn "$searchstr" $filepath/* | wc -l`
matchingfiles=`grep -rn "$searchstr" $filepath/* | uniq | wc -l` 


#echo $matchingstr
#echo $matchingfiles
if [ ! $matchingstr ];then
	echo -e "No string found"
fi


########################################################################################################
#
# This echo gives the number of occurrences of the searched string and the number of files it exists in.
#
########################################################################################################

echo -e "The number of files are $matchingfiles and the number of matching lines are $matchingstr"




