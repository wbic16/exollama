#!/bin/bash
source exollama.inc
HAVE_AC=`grep -c '^Coord:' $EXOLLAMA_ROOT/agents/agent.$ID`
AC="1.1.1/1.1.1/1.1.1"
if [ $HAVE_AC -eq 1 ]; then
  AC=`grep 'Coord:' $EXOLLAMA_ROOT/agents/agent.$ID`
fi
echo $AC
