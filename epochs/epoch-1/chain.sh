#!/bin/bash
source exollama.inc
echo "Thinking..."
P1=`$EXOLLAMA_ROOT/dq.sh "$1"`
echo "$P1"
echo "Refining..."
P2=`$EXOLLAMA_ROOT/dq.sh "$P1"`
echo "$P2"
echo "Considering..."
P3=`$EXOLLAMA_ROOT/dq.sh "$P2"`
echo "$P3"
echo "Finalizing..."
P4=`$EXOLLAMA_ROOT/dq.sh "$P3"`
echo $P4
