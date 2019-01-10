#!/bin/bash
#
if [[ -n $(find /opt/ -type d -name "epops*") ]]
then
  echo "EPOps install directory found"
  if [[ -n $(service epops-agent status | grep "is not running") ]]
  then
    echo "EPOps agent is NOT running"
    echo "Trying to start agent..."
    if [[ -n $(systemctl list-units --type service --all | grep "epops-agent") ]]
    then
      service epops-agent start
    else
      echo "EPOps service not installed, try to start agent from epops/bin directory manually"
    fi  
  else
    echo "EPOps agent is running"
    exit 0
  fi
else
  echo "EPOps install directory NOT found"
  exit 1
fi
