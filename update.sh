#!/bin/bash
SECONDS=0
        echo "Scan Starttime is `date`"

OLDIFS=$IFS


#IFS=''
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
        echo -e "$git_file is a ${RED}binary${NC} file"
        fi
        done
        cd $CWD
        done
RED='\033[0;31m'
NC='\033[0m'
        echo -e "${RED}Other executable files found are${NC}"
