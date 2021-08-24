FROM openjdk:8-jdk-slim

RUN apt-get update && apt-get upgrade \
    && apt-get install -y wget vim ssh openssh-server curl iputils-ping 
    

RUN wget https://httpd-mirror.sergal.org/apache/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz 
    
RUN tar -xzf hadoop-3.3.1.tar.gz -C /usr \
    && rm hadoop-3.3.1.tar.gz \
    && chown -R root:root /usr/hadoop-3.3.1

RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa \
    && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
    && chmod 0600 ~/.ssh/authorized_keys

RUN mkdir -p /data/hdfs/namenode \
    && mkdir -p /data/hdfs/datanode

ADD config/* /usr/hadoop-3.3.1/etc/hadoop

ADD start.sh /

ENV HADOOP_VERSION 3.3.1
ENV HADOOP_MINOR_VERSION 3.1
ENV HADOOP_HOME /usr/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop

ENV PATH $PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin

RUN echo "export JAVA_HOME=${JAVA_HOME}" >> /etc/environment 

RUN apt-get install net-tools

EXPOSE 9000 4040 8020 22 9083 10000 10001 10002 2181 2888 3888 9092 9999 8080 50070 10015 8242 8888

CMD ["/bin/bash","start.sh"]