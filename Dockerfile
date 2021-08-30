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

RUN echo "export JAVA_HOME=${JAVA_HOME}" >> /etc/environment 

RUN apt-get install net-tools

RUN apt-get install nano

RUN wget https://ftp.unicamp.br/pub/apache/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz \
        && tar -zxf spark-3.1.2-bin-hadoop3.2.tgz -C /usr \
        && rm spark-3.1.2-bin-hadoop3.2.tgz \
        && chown -R root:root /usr/spark-3.1.2-bin-hadoop3.2

RUN wget https://web.stanford.edu/class/archive/cs/cs109/cs109.1166/stuff/titanic.csv


RUN wget https://dlcdn.apache.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz \
        && tar -zxf apache-hive-3.1.2-bin.tar.gz -C /usr \
        && rm apache-hive-3.1.2-bin.tar.gz \
        && chown -R root:root /usr/apache-hive-3.1.2-bin

ADD config-hive/* /usr/apache-hive-3.1.2-bin/bin



ENV HADOOP_VERSION 3.3.1
ENV HADOOP_MINOR_VERSION 3.1
ENV HADOOP_HOME /usr/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV HIVE_HOME=/usr/apache-hive-3.1.2-bin


ENV PATH $PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:HIVE_HOME/bin



#RUN wget https://dlcdn.apache.org/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz
#
#RUN tar -xzf apache-flume-1.9.0-bin.tar.gz -C /usr \
#    && rm apache-flume-1.9.0-bin.tar.gz \
#    && chown -R root:root /usr/apache-flume-1.9.0-bin
#
#ADD config-flume/* /usr/apache-flume-1.9.0-bin/conf
#
#ADD plugin-flume/* /usr/apache-flume-1.9.0-bin/lib
#
#RUN rm /usr/apache-flume-1.9.0-bin/lib/twitter4j-core-3.0.3.jar \
#    && rm /usr/apache-flume-1.9.0-bin/lib/twitter4j-media-support-3.0.3.jar \
#    && rm /usr/apache-flume-1.9.0-bin/lib/twitter4j-stream-3.0.3.jar

EXPOSE 9770 8088

CMD ["/bin/bash","start.sh"]