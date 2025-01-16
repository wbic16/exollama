#!/bin/bash
source exollama.inc
export COLLECTION=`./coordinate.sh $ID |sed 's/^.*\/\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)\/\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)$/\1/g'`
echo $COLLECTION
