#!/bin/bash
SECONDS=0
        echo "Scan Starttime is `date`"

OLDIFS=$IFS


#IFS=''   
file='repolist.txt'
echo "$file"
while read i
	do
	CWD=$PWD	
  cd $CWD/"$(echo $i | tr -d '\r')"
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
        done < $file
RED='\033[0;31m'
NC='\033[0m'
	echo -e "${RED}Other executable files found are${NC}"
        find . -type f -executable -print  
        echo "Scan Endtime is `date`"
        duration=$SECONDS
        echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
