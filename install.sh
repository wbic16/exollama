#!/bin/sh
POD=$1
CURRENT_POD=""
if [ -f /etc/exollama.id ]; then
  CURRENT_POD=`cat /etc/exollama.id`
fi
if [ -f /etc/exollama/pod.id ]; then
  CURRENT_POD=`cat /etc/exollama/pod.id`
fi
if [ "x$POD" = "x" ]; then
  POD=$CURRENT_POD
fi
if [ "x$POD" = "x" ]; then
  echo "Usage: $0 <id>"
  echo "Where id is one of these epoch pods:"
  cd ./epochs/epoch-1
  ./list-spots.sh
  exit 1
fi
if [ ! -d /etc/exollama ]; then
  sudo mkdir /etc/exollama
  sudo chown $USER:$USER /etc/exollama
fi
if [ "x$CURRENT_POD" != "x$POD" ]; then
  if [ -f "./epochs/epoch-1/$POD.phext" ]; then
    echo -n $POD >/etc/exollama/pod.id
    echo "Configured node for $POD"
    cat ./epochs/epoch-1/$POD.phext
    cat exopod.service.template |sed 's/__POD__/'$POD'/g' >exopod.service
    sudo mv exopod.service /etc/avahi/services/exopod.service
    hostname >./epochs/epoch-1/$POD.host
    sudo service avahi-daemon restart
  else
    echo "Unknown epoch pod '$POD'."
  fi
fi
if [ -f /etc/exollama.id ]; then
  sudo mv /etc/exollama.id /etc/exollama/pod.id
fi
cp el-version /etc/exollama/el-version
