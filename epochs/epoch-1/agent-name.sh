#!/bin/bash
source exollama.inc
if [ -f $EXOLLAMA_ROOT/agents/agent.$ID ]; then
  grep 'Name:' $EXOLLAMA_ROOT/agents/agent.$ID |sed 's/Name: //g'
fi
