#!/bin/bash
source exollama.inc
export SERIES=`./coordinate.sh $ID |sed 's/^.*\.\([0-9]*\)\/\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)\/\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)$/\1/g'`
echo $SERIES
