#!/bin/sh

#increase memory

mkdir -m777 /tmp/zookeeper

echo "zookeeper host"
echo $ZOOKEEPER_HOST

echo "STARTING KAFKA"

#update zookeeper server host
sed -i "s/zookeeper.connect=localhost:2181/zookeeper.connect=$ZOOKEEPER_HOST/g" $KAFKA_HOME/config/server.properties

sed -i "s/zookeeper.connection.timeout.ms=6000/zookeeper.connection.timeout.ms=60000/g" $KAFKA_HOME/config/server.properties

#update listener
ip="$(ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"
echo "Internal IP Address detected is : $ip"
echo "listeners=PLAINTEXT://$ip:$PORT" >> $KAFKA_HOME/config/server.properties

#update outside listener 
echo "advertised.listeners=PLAINTEXT://$EXTERNAL_IP:$PORT$KAFKA_ADVERTISED_LISTENERS" >> $KAFKA_HOME/config/server.properties

#auto create topic
echo "auto.create.topics.enable=true" >> $KAFKA_HOME/config/server.properties

cat -n $KAFKA_HOME/config/server.properties

#start kafka
exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties


