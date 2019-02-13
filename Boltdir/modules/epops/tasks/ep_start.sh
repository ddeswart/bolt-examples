#!/bin/sh
#
echo "Starting EPOps agent"
cd /opt/${PT_installdir}/epops-agent-7.0.0/bin/
./ep-agent.sh start
wait
echo "Done"
