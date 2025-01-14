#!/bin/bash
source exollama.inc
CHAPTER=`./agent-coordinate.sh $ID |sed 's/^.*\.\([0-9]*\)\/\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)\/\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)$/\1/g'`
echo $CHAPTER
