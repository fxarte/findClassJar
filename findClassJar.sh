#!/bin/bash

FOLDER=$1
function usage(){
  echo "$0 <base folder to search jars in> <package and or classname pattern to look for>" 
}
if [ -z "$FOLDER" ];then
  echo "Must provide a folder"
  usage
elif [ ! -d "$FOLDER" ];then
  echo "Must provide a valid folder"
  usage
else
  jar="/cygdrive/c/Program Files/Java/jdk1.8.0_131/bin/jar.exe"
  find $FOLDER -name "*.jar" -print0 | while read -d $'\0' file
  do
    if [ "$("$jar" -tvf $file | grep $2)" ];then
    echo "'$2' found in '$file'"
    fi
  done
fi
