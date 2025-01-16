#!/bin/bash
source exollama.inc
export SCROLL=`./coordinate.sh $ID |sed 's/^.*\.\([0-9]*\)$/\1/g'`
echo $SCROLL
