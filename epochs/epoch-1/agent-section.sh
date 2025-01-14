#!/bin/bash
source exollama.inc
SECTION=`./agent-coordinate.sh $ID |sed 's/^.*\.\([0-9]*\)\.\([0-9]*\)$/\1/g'`
echo $SECTION
