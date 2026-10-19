#!/bin/bash
writefile=$1
writestr=$2
# ensure that both variable are nonzero length strings
if [ -n "$writefile" ] && [ -n "$writestr" ]
then
	if [ ! -d "$(dirname $writefile)" ]
	then
		# Create the directory and parents if needed
		mkdir -p $(dirname $writefile)
	fi
	# Create the file specified in writefile
	touch $writefile
	# overwrite writefile with writestr
	echo $writestr > $writefile
else
	# print error message
	echo "Not all arguments specified"
	echo "OVERVIEW:"
	echo "	Creates a file or overwrites contents of file with a string"
        echo "USAGE:"
        echo "  writer.sh writefile writestr"
        echo "ARGUMENTS"
        echo "  writefile: Full path to file to write writestr to"
        echo "  writestr: String to write to writefile"
	exit 1
fi
