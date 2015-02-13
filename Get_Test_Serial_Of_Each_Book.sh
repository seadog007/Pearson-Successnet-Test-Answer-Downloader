SID=$1
ISBN=$2
while read line
do

	[ "$line" == "MT" ] && continue
	curl -s 'https://www.pearsonsuccessnet.com/snpapp/ois/DPSearchTestAction.do' \
		 -H "Cookie: SNSESSIONID=$SID" \
		 --data "subcontext=product&step=2&search=true&isbnOID=$ISBN&testTypeOID=$line" \
		 | sed 's/\t//g' \
		 | grep 'authTestID="......"' \
		 | awk -F\" '{print $2}'

done < <(\
curl -s 'https://www.pearsonsuccessnet.com/snpapp/ois/DPSearchTestAction.do' \
	 -H "Cookie: SNSESSIONID=$SID" \
	 --data "step=2&search=true&isbnOID=$ISBN&testTypeOID=-1" \
	 | grep -A20 'select name="testTypeOID"' \
	 | sed 's/\t//g' \
	 | grep '<option value="\(.*\)">' \
	 | sed 's/<option value="\(.[^"]*\)".*/\1/g' \
	 | sed -n '2,$p')


