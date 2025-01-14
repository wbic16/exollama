#!/bin/bash
source exollama.inc
SCROLL=`./agent-coordinate.sh $ID |sed 's/^.*\.\([0-9]*\)$/\1/g'`
echo $SCROLL
