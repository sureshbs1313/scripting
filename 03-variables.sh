#!/bin/bash

## if you assing a name to set of data that is called a variable.

## In shell there are no data types by default, everything is a string. As a author of script you should whether the value inside this variable is which data type.
## Syntax is VAR_NAME=DATA

a=10
b=xyz
c=1234abcd


## To access the variable we use $VAR_NAME
echo $a $b $c

### Lets make some statement which is not true all the time.
DATE=2019-01-03 
echo "Today date is $DATE"



## Most of the times you need to decalre variables during run time. That can be done in two ways
#### 1. Command Substitution
###  VARIABLE=$(commands)
#### 2. Arithematic Substitution
###  VARIABLE=$((arithematic expression))

DATE=$(date +%Y-%m-%d)
echo "Today date is $DATE"

X=$((1+2-1+4*5/6))
echo X = $X
