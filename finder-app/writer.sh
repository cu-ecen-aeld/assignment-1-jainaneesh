#!/usr/bin/bash


########################################################################################################
#
#	Author : Aneesh Jain
#	Topic  : Assignment1 - writer.sh
#
########################################################################################################
 # Passing the first argument - path of directory to filesdir
# Passing the second argument - string to be searched



writefile=$1			# Passing the first argument - path of file to be written to to writefile
writestr=$2                     # Passing the second argument - string to be written


########################################################################################################
#
# This if statement will check for the arguments passed to this script in the order 1, 2 and will exit 
# if the required number of arguments were not given.
#
########################################################################################################


if [ $# -lt 2 ];
then
	echo -e "This script takes two(2) arguments:"
	echo -e "\t1) Directory on the file system"
	echo -e "\t2) String to be searched through the file system"
	exit 1
fi

#echo $writefile
filepath=${writefile%/*}
basename=${writefile##*/}
#echo $filepath
#mkdir $filepath && cd $filepath


########################################################################################################
#
# This if statement will check for the existence of the file and over-writes its content.
#
########################################################################################################
if [ -f $writefile ];
then
	echo -e "File already exists..."
	echo -e "Writing string $writestr to $writefile"
	echo "$writestr" > $writefile
fi


########################################################################################################
#
# This if statement will check if the directory passed in the arguments already exists or create it if
# not. This if also echoes if files could be created or not.
#
########################################################################################################

if [ ! -d $filepath ];
then
	echo -e "Directory does not exist...creating directory $filepath"
        mkdir -p $filepath && touch $filepath/$basename

	if [ ! -f $writefile ];
	then	
		echo -e "The specified file could not be created"
		exit 1
	fi
	echo -e "Writing string $writestr to $writefile"
	echo "$writestr" > $writefile
fi


echo "$writestr" > $writefile
