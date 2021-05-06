#!/bin/bash
if [ ! -d /hutest ]
then 
	mkdir /hutest
fi

cd /hutest
for ((i=1;i<=10;i++))
do 
	filename=$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c 6)
	touch "$filename"_gg.txt
done
