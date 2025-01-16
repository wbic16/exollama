#!/bin/bash
source exollama.inc
export SHELF=`./coordinate.sh $ID |sed 's/^.*\.\([0-9]*\)\.\([0-9]*\)\/\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)\/\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)$/\1/g'`
echo $SHELF
