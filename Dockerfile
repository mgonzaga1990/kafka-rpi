FROM mjayson/java11-rpi

MAINTAINER markjayson.gonzaga1990@gmail.com

RUN apk update && apk --no-cache add curl && apk add --no-cache --upgrade bash

ENV KAFKA_VERSION=2.4.1 \
    SCALA_VERSION=2.12

ENV KAFKA_HOME=/kafka_${SCALA_VERSION}-${KAFKA_VERSION}

ENV PATH=${PATH}:${KAFKA_HOME}/bin

COPY entrypoint.sh /tmp/

RUN mv /tmp/entrypoint.sh /usr/bin

RUN wget -P /opt http://mirror.rise.ph/apache/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz
RUN tar -xvf /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

RUN chmod +x /usr/bin/entrypoint.sh

CMD /usr/bin/entrypoint.sh
