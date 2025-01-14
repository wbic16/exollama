#!/bin/bash
source exollama.inc
LIBRARY=`./agent-coordinate.sh $ID |sed 's/Coord: //g' |sed 's/\..*$//g'`
echo $LIBRARY
