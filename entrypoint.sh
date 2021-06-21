#!/usr/bin/env bash

JAVA_ARGS="-XX:+UseConcMarkSweepGC -XX:ReservedCodeCacheSize=256m -XX:+CMSScavengeBeforeRemark -XX:+CMSParallelRemarkEnabled"

# use 80% memory
MEM_KB=`cat /proc/meminfo  |grep MemTotal |awk '{print $2}'`
MEM_USE=$(( $MEM_KB / 1024 / 1024 * 8 / 10 ))
JAVA_ARGS="${JAVA_ARGS} -Xmx${MEM_USE}g -Xms${MEM_USE}g"

DATA_DIR=/opt/coin/data
mkdir -p ${DATA_DIR}/{logs,blocks}
ln -s ${DATA_DIR}/logs /opt/coin/logs

if test $# -eq 0; then
  sed -i -e 's/maxTimeRatio = 5.0/maxTimeRatio = 20.0/g' \
    -e 's/maxHttpConnectNumber = 50/maxHttpConnectNumber = 100/g' \
    -e 's/maxActiveNodes = 30/maxActiveNodes = 100/g' \
    -e 's/supportConstant = false/supportConstant = true/g' \
    -e 's/saveInternalTx = false/saveInternalTx = true/g' \
    main_net_config.conf
  exec java ${JAVA_ARGS} -jar FullNode.jar -d ${DATA_DIR}/blocks -c main_net_config.conf
else
  exec $@
fi
