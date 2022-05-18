#!/bin/bash
mkdir -p ~/workspace
cp sourcefile ~/workspace/
lineno=$(wc -l sourcefile| awk '{print $1}')
OLDIFS=$IFS
IFS=$'='

for ((itr = 1 ; itr <= $lineno ; itr++));
do
  cd ~/workspace
  OLDIFS=$IFS
  IFS=$'='
  for destrepo in `cat sourcefile | cut -d ':' -f2 | sed "${itr}q;d"`
  do
     git clone git@github.kroger.com:kt/$destrepo.git
        for sourcerepo in `cat sourcefile | cut -d ':' -f1 |  sed "${itr}q;d"`
        do
        rm -rf $sourcerepo/.git
        mv $sourcerepo $destrepo/
        done
        cd $destrepo
        git remote rm origin
        git remote add origin git@github.com:krogertechnology/$destrepo.git
        git push origin --all
   done
done
