#!/bin/sh

#increase memory

mkdir -m777 /tmp/zookeeper

echo "STARTING ZOOKEEPER"

#start zookeeper
exec $KAFKA_HOME/bin/zookeeper-server-start.sh -daemon $KAFKA_HOME/config/zookeeper.properties > /dev/null 2>&1 &
sleep 2

echo "STARTING KAFKA"
#start kafka
exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties

sleep 2
