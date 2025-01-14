#!/bin/bash
ID=$1
if [ "x$1" = "x" ]; then ID=1; fi
source exollama.inc
AGENT_COORD=`./agent-coordinate.sh $ID`
AGENT_NAME=`./agent-name.sh $ID`
echo "$AGENT_NAME @ $AGENT_COORD"
SCROLL=`./agent-scroll.sh $ID`
SECTION=`./agent-section.sh $ID`
CHAPTER=`./agent-chapter.sh $ID`
BOOK=`./agent-book.sh $ID`
VOLUME=`./agent-volume.sh $ID`
COLLECTION=`./agent-collection.sh $ID`
SERIES=`./agent-series.sh $ID`
SHELF=`./agent-shelf.sh $ID`
LIBRARY=`./agent-library.sh $ID`
SCROLL=$(($SCROLL+1))
echo "Next Coor: $LIBRARY.$SHELF.$SERIES/$COLLECTION.$VOLUME.$BOOK/$CHAPTER.$SECTION.$SCROLL"
