#!/bin/sh
if [ -f ../../agents/agent.$1 ]; then
  grep 'Name:' ../../agents/agent.$1 |sed 's/Name: //g'
fi
