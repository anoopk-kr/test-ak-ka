#!/bin/bash
SECONDS=0
        echo "Scan Starttime is `date`"

OLDIFS=$IFS


IFS=''
cat repolist |
        while read i
        do
        CWD=$PWD
        cd $CWD/"$i"
        echo "$i"
        git_files=$(git ls-files | grep -iEv 'yaml|yml|readme')
        for git_file in $git_files; do
        encoding=$(file --mime-encoding "$git_file")
        type=$(echo "$encoding" | awk -F ':' '{print $2}')
        if [ "$type" == " binary" ]; then
        echo "$git_file is a binary file"
        fi
        done
        cd $CWD
        done
        find . -type f -executable -print
        echo "Scan Endtime is `date`"
        duration=$SECONDS
        echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
