# kafka-rpi

Simple command to run docker image
NOTE : ZOOKEEPER SHOULD BE RUNNING FIRST.
```
docker run -p $PORT:$PORT -e ZOOKEEPER_HOST=$HOST:$PORT|2181 -e EXTERNAL_IP=$DOCKER_IP -e TOPICS=$TOPICS mjayson/kafka-rpi
```
