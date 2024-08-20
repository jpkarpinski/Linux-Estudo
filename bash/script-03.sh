#!/bin/bash

myvar="TESTE"
myage="21"

echo "My var is $myvar."
echo "My age is $myage."

cd /

files=$(ls)

echo "Files from pwd: $(pwd)"
echo $files

echo "The system time and date is: "
date

echo "Your username is: $USER"

echo "Your groups is: "
groups