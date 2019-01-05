#!/bin/bash

## Define a function 
func_name() {
    echo echo from function
}

## Call your function 
func_name

## If you observed we have declared the function before calling it and it has to be that way.
## If you observed , You are calling a function like just a command. Because function is also a type of command in Linux. So it inherits some properties just like a command.


### Exit Command of function 
func1() {
    echo Hello 
    return
    echo Bye
}

func1

### return command is as simply equialent as exit command. Only difference is exit will terminate the complete script where as return will terminate your function.

### You can also use exit status to return command like exit command and number ranges from 0-255

### Exit Status of function 
func2() {
    echo Hello 
    return 10
    echo Bye
}

func2 
echo "Exit status of function func2 = $?"

### Variable scope in functions.
# 1. You define variable in main program and you can access that variable inside function
# 2. You define variable in function and you can access that variable from main program.
# 3. You can override the variable defined in main program inside function and even vice-versa.
# 4. You can declare the variables locally inside a function by using local command and their scope is only inside that function.


### Local variables 
func3() {
    local a3=20
    echo "Value of a3 in function = $a3"
}

func3
echo "Value of a3 in main program= $a3"


### Arguments to function is different with the arguments parsed to script.
func4() {
    echo First Argument = $1
}

func4 abc