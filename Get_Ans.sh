#!/bin/bash
SID=$1
[ -z $1 ] && echo "Please enter the Session ID." && exit 1
rm tmp
rm -rf dump/
./Book_Selecter.sh $SID
./Downloader.sh $SID
rm tmp
mkdir dump
mv view* dump/
./Rename.sh dump
