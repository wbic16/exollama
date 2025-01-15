#!/bin/bash
INSTALL_DIR=$1
if [ "x$1" = "x" ]; then
  INSTALL_DIR="/usr/local/exollama"
else
  INSTALL_DIR=$1
fi
cp *.phext $INSTALL_DIR/
cp *.sh $INSTALL_DIR/
cp *.inc $INSTALL_DIR/
cp ../../*.sh $INSTALL_DIR/
cp -R ../../agents/ $INSTALL_DIR/agents/
ls -l $INSTALL_DIR
