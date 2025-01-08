#!/bin/sh
POD=$1
if [ "x$POD" = "x" ]; then
  echo "Usage: $0 <id>"
  echo "Where id is one of these epoch pods:"
  cd ./epochs/epoch-1
  ./list-spots.sh
  exit 1
fi
if [ -f "./epochs/epoch-1/$POD.phext" ]; then
  sudo echo -n $POD /etc/exollama.id
  echo "Configured node for $POD"
  cat ./epochs/epoch-1/$POD.phext
  cat exopod.service.template |sed 's/__POD__/'$POD'/g' >exopod.service
  sudo mv exopod.service /etc/avahi/services/exopod.service
  hostname >./epochs/epoch-1/$POD.host
  sudo service avahi-daemon restart
else
  echo "Unknown epoch pod $POD."
fi
