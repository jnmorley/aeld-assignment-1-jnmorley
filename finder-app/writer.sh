#!/bin/bash
writefile=$1
writestr=$2
if [ -n "$writefile" ] && [ -n "$writestr" ]
then
	mkdir -p $(dirname $writefile)
	touch $writefile
	echo $writestr > $writefile
else
	echo "Not all arguments specified"
	exit 1
fi
