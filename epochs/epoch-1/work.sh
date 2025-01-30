#!/bin/bash
STEP=$1
if [ "x$STEP" = "x" ]; then
  STEP=1
fi
WORK_ROUTER_RUNNING=`ps -ef |grep -v grep |grep -c "sq requirements.phext"`
if [ $WORK_ROUTER_RUNNING -eq 0 ]; then
  killall sq >/dev/null 2>&1
  rm -rf .sq
  sq requirements.phext &
fi
sq pull 1.1.1/1.1.1/1.1.$STEP prompt.txt
ollama run "deepseek-r1:1.5b" <prompt.txt
