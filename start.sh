#!/bin/bash

i=1
while [ $i -lt 4 ]
do
	docker start namenode$i &> /dev/null
	docker start zk$i &> /dev/null
	docker start jn$i &> /dev/null
	i=$(( $i + 1 ))
done 

i=1
while [ $i -lt 8 ]
do
	docker start worker$i &> /dev/null
	i=$(( $i + 1 ))
done 

docker start hivemeta &> /dev/null