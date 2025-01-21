#!/bin/bash
echo "Thinking..."
P1=`../../dq.sh "$1"`
echo "$P1"
echo "Refining..."
P2=`../../dq.sh "$P1"`
echo "$P2"
echo "Considering..."
P3=`../../dq.sh "$P2"`
echo "$P3"
echo "Finalizing..."
P4=`../../dq.sh "$P3"`
echo $P4
