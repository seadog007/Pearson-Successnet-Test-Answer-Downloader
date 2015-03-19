#!/bin/bash
SID=$1
while read line
do
	curl -s "https://www.pearsonsuccessnet.com/snpapp/authoring/viewTestSummary.do?method=getTestSummary&testId=$line" -H "Cookie: SNSESSIONID=$SID;" -O
done < tmp
