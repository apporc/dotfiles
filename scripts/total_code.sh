#!/bin/bash


type=$1
total=0
for x in `find . -name "$type"`;
do
  echo $x
	single=`cat $x|wc -l`
	let "total=$total+$single"
done
 
echo $total
