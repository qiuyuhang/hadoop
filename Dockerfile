FROM qiuyuhang/hadoop-base

MAINTAINER qiuyuhang <imqyh@qq.com>

WORKDIR /root

COPY config /tmp/

# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys

RUN mkdir -p ~/hadoop/namenode && \ 
    mkdir -p ~/hadoop/datanode && \
    mkdir -p ~/hadoop/zkdata && \
    mkdir -p ~/hadoop/zklog && \
    mkdir -p ~/hadoop/mapred && \
    mkdir -p ~/hadoop/journaldata && \
    mkdir -p ~/hadoop/tmp && \
    mkdir $HADOOP_HOME/logs

RUN mv /tmp/ssh_config ~/.ssh/config && \
    mv /tmp/hadoop-conf/* $HADOOP_HOME/etc/hadoop/ && \
    mv /tmp/zoo.cfg /opt/zookeeper/conf/ && \
    mv /tmp/start-hadoop.sh ~/start-hadoop.sh && \
    mv /tmp/run-wordcount.sh ~/run-wordcount.sh && \
    rm $HADOOP_HOME/sbin/*.cmd && \
    rm $HADOOP_HOME/etc/hadoop/*.cmd && \
    rm $ZK_HOME/bin/*.cmd

CMD [ "sh", "-c", "service ssh start; bash"]
