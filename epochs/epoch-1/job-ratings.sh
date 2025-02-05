#!/bin/bash
while IFS= read -r LINE
do
  echo "Calculate the importance of this task, in relation to the exocortex. $LINE">temp.txt
  ../../dq.sh <temp.txt
  rm -f temp.txt
done <jobs.phext
