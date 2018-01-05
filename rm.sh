#!/bin/bash

i=1
while [ $i -lt 4 ]
do
	docker rm -f namenode$i &> /dev/null
	docker rm -f zk$i &> /dev/null
	docker rm -f jn$i &> /dev/null
	i=$(( $i + 1 ))
done 

i=1
while [ $i -lt 8 ]
do
	docker rm -f worker$i &> /dev/null
	i=$(( $i + 1 ))
done 