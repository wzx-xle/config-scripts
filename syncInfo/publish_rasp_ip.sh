#!/bin/bash

machine="rasp"
ipFile="${machine}.ip"
if [ ! -f "$ipFile" ]; then
	touch $ipFile
fi

oldIp=`cat $ipFile`
#echo $oldIp

getIpUrl='http://members.3322.org/dyndns/getip'

currIp=`curl -s $getIpUrl`
hostname=`cat /etc/hostname`
currTime=`date +%F_%T`
#echo $currIp

if [ "$oldIp" = "$currIp" ]; then
	echo "ip not change"
else
	echo "new ip is $currIp"
	
	git pull
	
	echo "$hostname $currTime $currIp" >> $ipFile
	
	git add $ipFile
	git commit -m "${machine} ip address was changed."
	git push -u origin master
fi
