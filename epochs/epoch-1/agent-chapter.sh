#!/bin/bash
source exollama.inc
export CHAPTER=`./coordinate.sh $ID |sed 's/^.*\/\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)$/\1/g'`
echo $CHAPTER
