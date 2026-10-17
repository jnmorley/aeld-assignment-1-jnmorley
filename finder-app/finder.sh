#!/bin/bash
filesdir=$1
searchstr=$2

if [ -n "$filesdir" ] && [ -n "$searchstr" ]
then
	#if both arguments are present
    	if [ -d "${filesdir}" ]
	# and  $1 is a directory
	then
    		X=0
    		Y=0
		# count the files listed by the find command
    		for i in $(find $filesdir -type f)
    		do
			X=$(($X + 1))
   		done
		# have grep count the lines where searchstr appears in file and add them up
    		for i in $(grep -ihc -d recurse $searchstr $filesdir)
    		do
			Y=$(($Y + $i))
    		done
		# report the result
    		echo The number of files are $X and the number of matching lines are $Y
	else
		echo "${filesdir} does not exist or is not a directory"
	fi
else
	echo "Not all arguments specified"
	echo "OVERVIEW:"
	echo "	prints message including how many files are in the directory and subdirectories specified by filesdir and how many lines does searchstr occur in those files"
	echo "USAGE:"
	echo "	finder.sh filesdir searchstr"
	echo "ARGUMENTS"
	echo "	filesdir: path to dirctory to search"
	echo "	searchstr: string to search for in files"
	exit 1
fi
