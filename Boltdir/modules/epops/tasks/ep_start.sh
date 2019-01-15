#!/bin/sh
#
echo "Starting EPOps agent"
cd /opt/${PT_installdir}/epops-agent-7.0.0/bin/
./ep-agent.sh start
wait
## Second start just to be sure ##
./ep-agent.sh stop
wait
./ep-agent.sh start
wait
echo "Done"