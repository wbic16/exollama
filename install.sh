#!/bin/sh
if [ "x$1" = "x" ]; then
  echo "Usage: $0 <id>"
  echo "Where id is one of these epoch pods:"
  ls -1 ./epochs/epoch-1 |sed 's/\.phext//g' |sed 's/^/* /g'
  exit 1
fi
if [ -f "./epochs/epoch-1/$1.phext" ]; then
  sudo echo -n $1 /etc/exollama.id
  echo "Configured node for $1"
  cat ./epochs/epoch-1/$1.phext
else
  echo "Unknown epoch pod $1."
fi
