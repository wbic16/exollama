#!/bin/sh
ID=$1
A=$2
B=$3
C=$4
D=$5
E=$6
F=$7
if [ -z $A ]; then A=1; fi
if [ -z $B ]; then B=1; fi
if [ -z $C ]; then C=1; fi
if [ -z $D ]; then D=1; fi
if [ -z $E ]; then E=1; fi
if [ -z $F ]; then F=1; fi
ROUND=0
if [ -f round ]; then ROUND=`cat round`; fi
echo "2.$ROUND.$ID/$F.$E.$D/$C.$B.$A"
