#!/bin/bash
INSTALL_DIR=$1
if [ "x$1" = "x" ]; then
  INSTALL_DIR="/usr/local/exollama"
else
  INSTALL_DIR=$1
fi
HAVE_DATA=`wc -l $INSTALL_DIR/*.phext`
if [ $HAVE_DATA -eq 0 ]; then
  cp *.phext $INSTALL_DIR/
  cp -R ../../agents/ $INSTALL_DIR/agents/
fi
cp el-version $INSTALL_DIR/
cp *.sh $INSTALL_DIR/
cp *.inc $INSTALL_DIR/
cp *.roster $INSTALL_DIR/
cp *.host $INSTALL_DIR/
cp ../../*.sh $INSTALL_DIR/
if [ ! -d $INSTALL_DIR/books ]; then
  mkdir $INSTALL_DIR/books
fi
cp books/*.phext $INSTALL_DIR/books/
if [ ! -d $INSTALL_DIR/phext-howto ]; then
  mkdir $INSTALL_DIR/phext-howto
fi
cp phext-howto/*.phext $INSTALL_DIR/phext-howto/
cp phext-howto/*.rs $INSTALL_DIR/phext-howto/
ls -l $INSTALL_DIR
