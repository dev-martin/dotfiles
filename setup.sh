#!/bin/bash

files=$(ls -a)

for file in $files
do
   if [[ ("$file" != "..") || ("$file" != ".") || ("$file" != ".git") ]];
   then  
      echo $file
   fi
done
