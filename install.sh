#!/bin/sh
if [ "x$1" = "x" ]; then
  echo "Usage: $0 <id>"
  echo "Where id is one of these epoch pods:"
  cd ./epochs/epoch-1
  ./list-spots.sh
  exit 1
fi
if [ -f "./epochs/epoch-1/$1.phext" ]; then
  sudo echo -n $1 /etc/exollama.id
  echo "Configured node for $1"
  cat ./epochs/epoch-1/$1.phext
else
  echo "Unknown epoch pod $1."
fi
