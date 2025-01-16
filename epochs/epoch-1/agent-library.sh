#!/bin/bash
source exollama.inc
export LIBRARY=`./coordinate.sh $ID |sed 's/Coord: //g' |sed 's/\..*$//g'`
echo $LIBRARY
