#!/bin/bash

ip=$(curl -s https://api.ipify.org)
ipFile=ipadd.txt
[ -f $ipFile ] && read last < $ipFile

echo "last $last";
echo $ip > $ipFile 

if [ "$ip" = "$last" ]; then
	#git checkout ip-updater && git add . && git commit -m 'new ip'
	echo 'equal'
else 
	echo 'not equal'
	#git checkout ip-updater
	git add .
	git commit -m 'new ip'
	git push origin ip-updater
	#eval "git checkout ip-updater && git add . && git commit -m 'new ip'"
fi

