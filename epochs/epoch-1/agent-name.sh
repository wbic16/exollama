#!/bin/sh
EXOLLAMA_ROOT="../.."
if [ -f "/usr/local/exollama" ]; then
  EXOLLAMA_ROOT="/usr/local/exollama"
fi
if [ -f $EXOLLAMA_ROOT/agents/agent.$1 ]; then
  grep 'Name:' $EXOLLAMA_ROOT/agents/agent.$1 |sed 's/Name: //g'
fi
