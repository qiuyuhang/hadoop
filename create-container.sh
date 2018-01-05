#!/bin/bash

# start hadoop container
i=1
while [ $i -lt 4 ]
do
	docker rm -f namenode$i &> /dev/null
	docker rm -f zk$i &> /dev/null
	docker rm -f jn$i &> /dev/null

	echo "start namenode$i container..."
	docker run -itd --net=hadoop \
                -p ${i}22:22 \
                -p ${i}8088:8088 \
                -p ${i}9870:9870 \
                --name namenode$i --hostname namenode$i qiuyuhang/hadoop &> /dev/null

	echo "start zk$i container..."
	docker run -itd --net=hadoop \
		--name zk$i --hostname zk$i qiuyuhang/hadoop &> /dev/null

	docker exec -it zk$i bash -c "echo $i > /root/hadoop/zkdata/myid"
	docker exec -it zk$i bash -c "zkServer.sh start"

	echo "start jn$i container..."
	docker run -itd --net=hadoop \
		--name jn$i --hostname jn$i qiuyuhang/hadoop &> /dev/null

	i=$(( $i + 1 ))
done 

i=1
while [ $i -lt 8 ]
do
	docker rm -f worker$i &> /dev/null

	echo "start worker$i container..."
	docker run -itd --net=hadoop \
		--name worker$i --hostname worker$i qiuyuhang/hadoop &> /dev/null
	i=$(( $i + 1 ))
done 

