#!/bin/bash
dir=/hutest
cd $dir
for i in $(ls *.txt)
do 
    perstr=$(echo $i |head -c 6)
    mv $i ${perstr}_test.HTML
done

