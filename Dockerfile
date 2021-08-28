FROM openjdk:8-jdk-slim

RUN apt-get update -y && apt-get -y upgrade \
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

RUN apt-get install nano

RUN wget https://dlcdn.apache.org/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz

RUN tar -xzf apache-flume-1.9.0-bin.tar.gz -C /usr \
    && rm apache-flume-1.9.0-bin.tar.gz \
    && chown -R root:root /usr/apache-flume-1.9.0-bin

ADD config-flume/* /usr/apache-flume-1.9.0-bin/conf

EXPOSE 9770 8088

CMD ["/bin/bash","start.sh"]