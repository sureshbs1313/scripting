#!/bin/bash

## In shell scripting there are two conditinal commands
### 1. case
### 2. if 

## case condition is usually used to compare the strings. If a variable matches with a value then case command can execute its assoiciated commands.

# Syntax:
# case $var in 
#   PATT1) commands ;;
#   PATT2) commands ;;
# esac

## In above syntax if value inside var variable mathes with PATT1 then it executes its commands.

UNAME=$(uname)
case $UNAME in 
    Linux) echo "Linux OS" ;;
    Darwin) echo "Mac OS" ;;
esac 

## Some casses of none of the pattern mathes then we have to execute a default commands and in case command we can use default pattern as * . NOTE: * should always be the last pattern.
case $UNAME in 
    Linux) echo "Linux OS" ;;
    Darwin) echo "Mac OS" ;;
    *) echo "Not Linux, Not Mac OS" ;;
esac 


## If command 
## If is usually found in three form.
#### 1. Simple if 
#### 2. If-Else
#### 3. Else-if 

### Simple if used to validate an expression and it is going to execute commands inside it,  if that expressions is true/success. So simple if would never bother about if expression is a failure/false.

### Syntax:
# if [ expression ]; then 
#   commands
# fi

### Some times you need to execute few command if the expression is success and also need to execute few more commands when expression is failure. During such requirements we may approach for If-Else.

# Syntax:
# if [ expression ]; then 
#   commands   -> These commands will get executed if expression is true
# else
#   commands    -> These commands will get executed if expression is false
# fi

## Finally some times we would be having a requirement to execute multiple expressions then we need Else-If

# if [ expression1 ]; then 
#   commands -> These commands will get executed if expression1 is true
# elsif [ expression2 ]; then 
#   commands  -> These commands will get executed if expression2 is true
# else 
#   commands  -> These commands will get executed if all the expressions are failure
# fi 


### Else-If is almost equialent to case statement, But in case we can compare only strings but if statement can do more.

### Expressions: 
#### 1. String expressions
## [ abc = abc ] -> True if both are equal.
### Operators : = , ==, != , -z, -n

UNAME=$(uname)
if [ "$UNAME" = Linux ]; then 
    echo Linux OS 
fi 

if [ "$UNAME" = Darwin ]; then 
    echo Mac OS 
fi 

if [ "$UNAME" != Linux ]; then 
    echo Not Linux OS 
fi

## NOTE: It is very important to keep these variables in double quotes to avoid the functinal errors.

## We can check whether a variable is having some data or not 
a="1"
if [ -z "$a" ];then 
    echo "a variable is empty"
fi 

if [ ! -z "$a" ];then 
    echo "a variable is not empty"
fi 

### -n = ! -z

if [ -n "$a" ];then 
    echo "a variable is not empty"
fi 

### Number expressions 
# -eq, -ne, -gt, -ge, -lt, -le

a=10

if [ "$a" -eq 10 ]; then 
    echo a is 10 
fi


## File expressions.
### Suggest to read man pages of bash
## man bash and search for /-eq to jump directly to expressions.

## TO check whether a director exists or not

dir1=/data 
if [ -d "$dir1" ]; then 
    echo "$dir1 directory exists"
else 
    echo "$dir1 directory does not exists"
fi 
