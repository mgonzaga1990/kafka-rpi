#!/bin/sh

#increase memory

mkdir -m777 /tmp/zookeeper

echo "zookeeper host"
echo $ZOOKEEPER_HOST

echo "STARTING KAFKA"

sed -i "s/zookeeper.connect=localhost:2181/zookeeper.connect=$ZOOKEEPER_HOST/g" $KAFKA_HOME/config/server.properties

#start kafka
exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties

#sleep 2

#while true
#do
#  sleep 1000
#done
