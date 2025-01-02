#!/bin/sh
x=0
touch .silent
while [ $x -lt 100 ]; do
  x=$(($x+1))
  if [ -f agent.$x ]; then
    echo "Agent $x: OK"
  else
    y=$(($x-1))
    echo "Generating Agent $x from Agent $y..."
    # avoid local min/max issues by pumping another call through...
    ./run.sh prompt.phext
    ./run.sh "agent.$y"
    /snap/bin/pwsh ./filter.ps1 "output.phext" "agent.$y" >"agent.$x"
    exit 0
  fi
done
rm -f .silent