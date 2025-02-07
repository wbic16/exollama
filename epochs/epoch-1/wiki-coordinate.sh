#!/bin/bash
set -e
ARTICLE="$1"
AL=${#ARTICLE}
INNER=$(($AL-2))
FIRST=${ARTICLE:0:1}
LAST=${ARTICLE:$AL-1:1}
FIRST=${FIRST^^}
LAST=${LAST^^}
FIRST=$(printf '%d' "'$FIRST")
LAST=$(printf '%d' "'$LAST")
#echo "Computing phext coordinate for Wikipedia Article '$ARTICLE'..."
#echo "First: $FIRST"
#echo "Length: $INNER"
#echo "Last: $LAST"
FIRST=$(($FIRST - 65))
LAST=$(($LAST - 65))
LIBRARY=$FIRST
SHELF=$INNER
SERIES=$LAST
IFS='_' read -ra parts <<< "$ARTICLE"
P1=${parts[0]^^}
P2=${parts[1]^^}
P3=${parts[2]^^}
P1L=$((${#P1} - 2))
P2L=$((${#P2} - 2))
P3L=$((${#P3} - 2))
P1F=${P1:0:1}
P2F=${P2:0:1}
P3F=${P3:0:1}
P1T=${P1:${#P1}-1:1}
P2T=${P2:${#P2}-1:1}
P3T=${P3:${#P3}-1:1}
#echo "1. $P1F.$P1L.$P1T"
#echo "2. $P2F.$P2L.$P2T"
#echo "3. $P3F.$P3L.$P3T"
P1F=$(printf '%d' "'$P1F")
P2F=$(printf '%d' "'$P2F")
P3F=$(printf '%d' "'$P3F")
P1T=$(printf '%d' "'$P1T")
P2T=$(printf '%d' "'$P2T")
P3T=$(printf '%d' "'$P3T")
P1F=$(($P1F - 65))
P2F=$(($P2F - 65))
P3F=$(($P3F - 65))
P1T=$(($P1T - 65))
P2T=$(($P2T - 65))
P3T=$(($P3T - 65))
COLLECTION=$(($P1F ^ $P2F ^ $P3F))
VOLUME=$(($P1L ^ $P2L ^ $P3L))
BOOK=$(($P1T ^ $P2T ^ $P3T))
echo "$LIBRARY.$SHELF.$SERIES/$COLLECTION.$VOLUME.$BOOK/1.1.1"
exit 0
