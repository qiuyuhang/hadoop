#!/bin/bash

i=1
while [ $i -lt 4 ]
do
	docker kill namenode$i &> /dev/null
	docker kill zk$i &> /dev/null
	docker kill jn$i &> /dev/null
	i=$(( $i + 1 ))
done 

i=1
while [ $i -lt 8 ]
do
	docker kill worker$i &> /dev/null
	i=$(( $i + 1 ))
done 

docker kill hivemeta &> /dev/null