#!/bin/sh
# Selects the current pod's roster
# pre: launch-pod has been run
sq select 1.1.1/1.1.1/1.1.1 |tail -n +2
