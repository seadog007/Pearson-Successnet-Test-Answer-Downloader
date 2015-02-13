#/bin/bash
SID=$1
echo "" > tmp
./Book_Selecter.sh $SID
./Downloader.sh $SID
rm tmp
mkdir dump
mv view* dump/
./Rename.sh dump
