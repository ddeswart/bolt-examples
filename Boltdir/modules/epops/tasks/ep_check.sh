#!/bin/bash
#
if [[ -n $(find /opt/ -type d -name "epops*") ]]
then
  echo "EPOps install directory found"
  if [[ -n $(systemctl list-units --type service --all | grep "epops-agent") ]]
  then
    if [[ -n $(service epops-agent status | grep "is not running") ]]
    then
      echo "EPOps agent is NOT running"
      echo "Trying to start agent..."
      service epops-agent start
    else
      echo "EPOps agent is running"
      service epops-agent status
      exit 0
    fi  
  else
    echo "EPOps agent service is NOT installed, try to start/stop it manually from EPOps bin directory"
    exit 0
  fi
else
  echo "EPOps install directory NOT found"
  exit 1
fi
