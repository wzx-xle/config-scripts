#!/bin/bash

# 2 hours
period=`expr 60 \* 60 \* 2`
#period=`expr 2 \* 2`

cd syncInfo

while true; do
	echo `date "+%Y-%m-%d %H:%M:%S"`
	
	# ִ�з���IP�Ľű�
	. ./publish_rasp_ip.sh
	
	sleep $period
	continue
done