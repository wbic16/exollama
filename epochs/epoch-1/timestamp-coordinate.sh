#!/bin/bash
if [ -z $1 ]; then
  timestamp=$(date +%s)
else
  timestamp=$1
fi
echo "Timestamp: $timestamp"
SCROLL=$(($timestamp % 100))
remaining=$(($timestamp - $SCROLL))
SCROLL=$(($SCROLL + 1))
remaining=$(($remaining/100))

SECTION=$(($remaining % 100))
remaining=$(($remaining - $SECTION))
SECTION=$(($SECTION + 1))
remaining=$(($remaining/100))

CHAPTER=$(($remaining % 100))
remaining=$(($remaining - $CHAPTER))
CHAPTER=$(($CHAPTER + 1))
remaining=$(($remaining/100))

BOOK=$(($remaining % 100))
remaining=$(($remaining - $BOOK))
BOOK=$(($BOOK + 1))
remaining=$(($remaining/100))

VOLUME=$(($remaining % 100))
remaining=$(($remaining - $VOLUME))
VOLUME=$(($VOLUME + 1))
remaining=$(($remaining/100))

COLLECTION=$(($remaining % 100))
remaining=$(($remaining - $COLLECTION))
COLLECTION=$(($COLLECTION + 1))
remaining=$(($remaining/100))

SERIES=$(($remaining % 100))
remaining=$(($remaining - $SERIES))
SERIES=$(($SERIES + 1))
remaining=$(($remaining/100))

SHELF=$(($remaining % 100))
remaining=$(($remaining - $SHELF))
SHELF=$(($SHELF + 1))
remaining=$(($remaining/100))

LIBRARY=$(($remaining % 100))
remaining=$(($remaining - $LIBRARY))
LIBRARY=$(($LIBRARY + 1))
remaining=$(($remaining/100))

echo "$LIBRARY.$SHELF.$SERIES/$COLLECTION.$VOLUME.$BOOK/$CHAPTER.$SECTION.$SCROLL"
date --date="@$timestamp" "+%Y-%m-%d %H:%M:%S"
