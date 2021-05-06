#!/bin/bash
web=(
https://www.baidu.com
https://www.sinaa.com
https://www.lalala.com
https://www.qq.com
1.1.1.1
3.12.3.23333
)
for i  in ${web[*]}

do 
	code=$(curl -o /dev/null -s --connect-timeout 5 -w '%{http_code}' $i | grep -E "200|302" ) #检测curl状态码
	echo "$code,$i"
	if [ "$code" != "" ]
        then
		echo "$i is ok " >> /HuStudy/ok.log           #若code值为空时候，则10S后再次检测
	
	else
		sleep 10
	
		code=$(curl -o /dev/null -s --connect-timeout 5 -w '%{http_code}' $i | grep -E "200|302" )
		
		if [ "$code" != "" ]
       	        then
               		 echo "$i is ok " >> /HuStudy/ok.log 
		else
			 echo "$i is error" >> /HuStudy/err.log

                fi
        fi
done
