#!/bin/bash

SID=$1
cmd=(dialog --separate-output --checklist "Select options:" 22 76 16)
options=()
while read line; do
	options+=($(echo $line | awk -F\" '{print $2}'))
	options+=("$(echo $line | awk -F\<\|\> '{print $3}')")
	options+=(off)
done < <(\
curl -s 'https://www.pearsonsuccessnet.com/snpapp/ois/DPSearchTestAction.do' \
	-H "Cookie: SNSESSIONID=$SID" \
	| grep -B30 'testTypeOID' \
	| grep option \
	| sed -e '1d' -e '$d' -e 's/\t//g')
echo ${options[*]}
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
	./Get_Test_Serial_Of_Each_Book.sh $SID $choice
done
