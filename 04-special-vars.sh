#!/bin/bash

## Special Variables are $0 to $n , $*, $@, $#, $$
echo '$0 =' $0  ### $0 is the script name which you are execiting.
echo '$1 =' $1  ### $1 is the first argument which was parsed to the script 
echo '$2 =' $2  ### $2 is second argument and so on it goes ... with $n
echo '$* =' $*  ### $* to get all the arguments parsed
echo '$@ =' $@  ### $@ to get all the arguments parsed
echo '$# =' $#  ### $# is the number of arguments parsed to the script.
echo '$$ =' $$  ### To get the PID of the script.