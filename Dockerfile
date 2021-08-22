FROM alpine:latest

RUN apk update && apk upgrade \
    && apk --no-cache add openjdk8 \
    && apk --no-cache add openssh \
    && apk --no-cache add --upgrade pdsh \
    && apk --no-cache add curl \
    && apk --no-cache add bash \
    && apk --no-cache add wget \
    && apk --no-cache add tar

RUN wget https://httpd-mirror.sergal.org/apache/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz 
    
RUN  tar -xzf hadoop-3.3.1.tar.gz -C /usr \
    && rm hadoop-3.3.1.tar.gz \
    && chown -R root:root /usr/hadoop-3.3.1

ADD config/* /usr/hadoop-3.3.1/etc/hadoop


ENV JAVA_HOME=/usr/lib/jvm/default-jvm

CMD ["/bin/bash"]