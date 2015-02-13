#/bin/bash
SID=$1
echo "" > tmp
./Book_Selecter.sh $SID
./Downloader.sh $SID
rm tmp
