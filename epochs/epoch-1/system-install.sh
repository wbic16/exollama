#!/bin/sh
INSTALL_DIR="/usr/local/exollama"
VERSION=`cat ../../el-version`
if [ "x$1" != "x" ]; then
  INSTALL_DIR=$1
fi
if [ ! -d $INSTALL_DIR ]; then
  sudo mkdir $INSTALL_DIR
  sudo chown $USER:$USER $INSTALL_DIR
else
  cd $INSTALL_DIR
  HAVE_EXOLLAMA=`git log |grep -c "exollama $VERSION"`
  if [ $HAVE_EXOLLAMA -eq 0 ]; then
    echo "Error: $INSTALL_DIR exists. Aborting install."
    exit 1
  fi
  echo "exollama $VERSION OK"
  exit 0
fi
if [ -d $INSTALL_DIR ]; then
  ./deploy.sh $INSTALL_DIR
  cd $INSTALL_DIR
  if [ ! -d .git ]; then
    git init
  fi
  git add .
  git commit -m "exollama $VERSION deployment (epoch 1)"
  echo "exollama environment initiated. You should consider adding an upstream backup."
fi
exit 0
