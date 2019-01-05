#!/bin/bash

### We have total 4 loops command, Yet we have basic two loop command which are used widely. 
# 1. while -> until
# 2. for -> select 

## When you need to execute a set of commands based on the expressions and to control the expression we can use while loop 

a=10
while [ $a -gt 0 ]; do 
    echo Hello 
    a=$(($a-1))
done

## When you need to execure a set of commands based on some inputs then we run the loop of commands for those values then we can use for loop.

# vim wget zip 

for package in vim wget zip ; do 
    sudo yum install $package -y 
done