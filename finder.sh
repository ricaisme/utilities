#!/bin/bash

#utility script to find and collect wanted files in some repository
#example of usage: 
#a bunch of files specific to retrive from a repository
#output:
#number of files found/not found, copy found files in a special repository

#ls -LR .SOURCE to get all files with absolute PATH
FILE=/home/mhu/files
SOURCE=/home/mhu/Downloads/portail/bins.txt
FOUND=0
NOTFOUND=0
for i in $(cat $FILE)
    do
        if (grep -q $i $SOURCE);then
            foundbin=$(echo $(grep -sw $i $SOURCE)| awk '{split($0,a,"bin");print a[1]}')
            foundbin=$foundbin"bin"
            echo "cp $foundbin"
            cpresult=$(cp  -i "$foundbin" /home/mhu/Downloads)
            echo "cp result is  $?"
            FOUND=$(($FOUND+1))
            echo "$i found in above $FOUND"
        else
            NOTFOUND=$(($NOTFOUND+1))
            echo "$i not found $NOTFOUND"
        fi
    done


echo "found $FOUND"
echo "not fount $NOTFOUND"
