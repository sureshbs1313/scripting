#!/usr/bin/env bash


printf "Hello World"  ## Not preferred because it needs lot of syntaxes
echo Hello World 

## echo command allows escape sequences and following are few which we discuss 
#### 1. \n  -> New Line
#### 2. \t  -> New Tab
#### 3. \e  -> New Color

### To print a new line while printing message we use \n esacape sequence

echo Hello\nWorld

## The above command will not work, because any escape sequence would work if you enable esacape sequence option in echo command.
### TO enable escape sequence we have -e option 

echo -e Hello \n World 

## THe above command will nto work, because any esacpe sequence would be preserved in either single or double quotes.

echo -e "Hello \n World"

## Note: When you enable esacape sequence it is need to be quoted and preferred one is double quotes.

## To print a new table space while printing the message 
echo -e "Hello\t\tWorld"

### TO print a message in a color we use \e esacape sequence.
### Colors are of two types 1. Foreground COlor (Font Color), 2. Background Color (Terminal Color)
### We have total 6 colors in Linux Shell 
###  Color          ForeGround Color COde           Background Color Code
###  Red            31                              41
###  Green          32                              42
###  Yellow         33                              43
###  Blue           34                              44
###  Magenta        35                              45
###  Cyan           36                              46

### Color code shuold be replaced in the following syntax
## To print Hello World in color the syntax is as follows.

####    echo -e "\e[<<<COLOR-CODE>>>mHello World"
##  COLOR-CODE should be replaced with the above numbers

## Red font color 
echo -e "\e[31mHello World"
echo -e "\e[43mHello World\e[0m"

### Color always follows with next lines as well, It is your responsibility to diable the color when you are completed printing the text in color.

### To disbale the color you just need to give color code as '0' (Number-0)

echo -e "\e[35mHello World\e[0m"

